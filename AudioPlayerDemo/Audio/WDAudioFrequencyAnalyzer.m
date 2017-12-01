//
//  WDAudioFrequencyAnalyzer.m
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//


#import "WDAudioFrequencyAnalyzer.h"
#import "WDAudioAnalyzer_Private.h"
#include <Accelerate/Accelerate.h>

@interface WDAudioFrequencyAnalyzer () {
@private
  size_t _log2Count;
  float _hammingWindow[kWDAudioAnalyzerCount];

  struct {
    float real[kWDAudioAnalyzerCount / 2];
    float imag[kWDAudioAnalyzerCount / 2];
  } _complexSplitBuffer;

  DSPSplitComplex _complexSplit;
  FFTSetup _fft;
}
@end

@implementation WDAudioFrequencyAnalyzer

- (id)init
{
  self = [super init];
  if (self) {
    _log2Count = (size_t)lrintf(log2f(kWDAudioAnalyzerCount));
    vDSP_hamm_window(_hammingWindow, kWDAudioAnalyzerCount, 0);

    _complexSplit.realp = _complexSplitBuffer.real;
    _complexSplit.imagp = _complexSplitBuffer.imag;
    _fft = vDSP_create_fftsetup(_log2Count, kFFTRadix2);
  }

  return self;
}

- (void)dealloc
{
  vDSP_destroy_fftsetup(_fft);
}

- (void)_splitInterleavedComplexVectors:(const float *)vectors
{
  vDSP_vmul(vectors, 1, _hammingWindow, 1, (float *)vectors, 1, kWDAudioAnalyzerCount);
  vDSP_ctoz((const DSPComplex *)vectors, 2, &_complexSplit, 1, kWDAudioAnalyzerCount / 2);
}

- (void)_performForwardDFTWithVectors:(const float *)vectors
{
  vDSP_fft_zrip(_fft, &_complexSplit, 1, _log2Count, kFFTDirection_Forward);
  vDSP_zvabs(&_complexSplit, 1, (float *)vectors, 1, kWDAudioAnalyzerCount / 2);

  static const float scale = 0.5f;
  vDSP_vsmul(vectors, 1, &scale, (float *)vectors, 1, kWDAudioAnalyzerCount / 2);
}

- (void)_normalizeVectors:(const float *)vectors toLevels:(float *)levels
{
  static const int size = kWDAudioAnalyzerCount / 4;
  vDSP_vsq(vectors, 1, (float *)vectors, 1, size);
  vvlog10f((float *)vectors, vectors, &size);

  static const float multiplier = 1.0f / 16.0f;
  const float increment = sqrtf(multiplier);
  vDSP_vsmsa((float *)vectors, 1, (float *)&multiplier, (float *)&increment, (float *)vectors, 1, kWDAudioAnalyzerCount / 2);

  for (size_t i = 0; i < kWDAudioAnalyzerLevelCount; ++i) {
    levels[i] = vectors[1 + ((size - 1) / kWDAudioAnalyzerLevelCount) * i];
  }
}

- (void)processChannelVectors:(const float *)vectors toLevels:(float *)levels
{
  [self _splitInterleavedComplexVectors:vectors];
  [self _performForwardDFTWithVectors:vectors];
  [self _normalizeVectors:vectors toLevels:levels];
}

@end
