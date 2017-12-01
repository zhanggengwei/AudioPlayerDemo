//
//  WDAudioFileProvider.m
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAudioStreamer.h"
#import "WDAudioStreamer_Private.h"
#import "WDAudioFileProvider.h"
#import "WDAudioEventLoop.h"

NSString *const kWDAudioStreamerErrorDomain = @"com.douban.audio-streamer.error-domain";

@interface WDAudioStreamer () {
@private
  id <WDAudioFile> _audioFile;

  WDAudioStreamerStatus _status;
  NSError *_error;

  NSTimeInterval _duration;
  NSInteger _timingOffset;

  WDAudioFileProvider *_fileProvider;
  WDAudioPlaybackItem *_playbackItem;
  WDAudioDecoder *_decoder;

  double _bufferingRatio;

#if TARGET_OS_IPHONE
  BOOL _pausedByInterruption;
#endif /* TARGET_OS_IPHONE */
}
@end

@implementation WDAudioStreamer

@synthesize status = _status;
@synthesize error = _error;

@synthesize duration = _duration;
@synthesize timingOffset = _timingOffset;

@synthesize fileProvider = _fileProvider;
@synthesize playbackItem = _playbackItem;
@synthesize decoder = _decoder;

@synthesize bufferingRatio = _bufferingRatio;

#if TARGET_OS_IPHONE
@synthesize pausedByInterruption = _pausedByInterruption;
#endif /* TARGET_OS_IPHONE */

+ (instancetype)streamerWithAudioFile:(id <WDAudioFile>)audioFile
{
  return [[[self class] alloc] initWithAudioFile:audioFile];
}

- (instancetype)initWithAudioFile:(id <WDAudioFile>)audioFile
{
  self = [super init];
  if (self) {
    _audioFile = audioFile;
    _status = WDAudioStreamerIdle;

    _fileProvider = [WDAudioFileProvider fileProviderWithAudioFile:_audioFile];
    if (_fileProvider == nil) {
      return nil;
    }

    _bufferingRatio = (double)[_fileProvider receivedLength] / [_fileProvider expectedLength];
  }

  return self;
}

+ (double)volume
{
  return [[WDAudioEventLoop sharedEventLoop] volume];
}

+ (void)setVolume:(double)volume
{
  [[WDAudioEventLoop sharedEventLoop] setVolume:volume];
}

+ (NSArray *)analyzers
{
  return [[WDAudioEventLoop sharedEventLoop] analyzers];
}

+ (void)setAnalyzers:(NSArray *)analyzers
{
  [[WDAudioEventLoop sharedEventLoop] setAnalyzers:analyzers];
}

+ (void)setHintWithAudioFile:(id <WDAudioFile>)audioFile
{
  [WDAudioFileProvider setHintWithAudioFile:audioFile];
}

- (id <WDAudioFile>)audioFile
{
  return _audioFile;
}

- (NSURL *)url
{
  return [_audioFile audioFileURL];
}

- (NSTimeInterval)currentTime
{
  if ([[WDAudioEventLoop sharedEventLoop] currentStreamer] != self) {
    return 0.0;
  }

  return [[WDAudioEventLoop sharedEventLoop] currentTime];
}

- (void)setCurrentTime:(NSTimeInterval)currentTime
{
  if ([[WDAudioEventLoop sharedEventLoop] currentStreamer] != self) {
    return;
  }

  [[WDAudioEventLoop sharedEventLoop] setCurrentTime:currentTime];
}

- (double)volume
{
  return [[self class] volume];
}

- (void)setVolume:(double)volume
{
  [[self class] setVolume:volume];
}

- (NSArray *)analyzers
{
  return [[self class] analyzers];
}

- (void)setAnalyzers:(NSArray *)analyzers
{
  [[self class] setAnalyzers:analyzers];
}

- (NSString *)cachedPath
{
  return [_fileProvider cachedPath];
}

- (NSURL *)cachedURL
{
  return [_fileProvider cachedURL];
}

- (NSString *)sha256
{
  return [_fileProvider sha256];
}

- (NSUInteger)expectedLength
{
  return [_fileProvider expectedLength];
}

- (NSUInteger)receivedLength
{
  return [_fileProvider receivedLength];
}

- (NSUInteger)downloadSpeed
{
  return [_fileProvider downloadSpeed];
}

- (void)play
{
  @synchronized(self) {
    if (_status != WDAudioStreamerPaused &&
        _status != WDAudioStreamerIdle &&
        _status != WDAudioStreamerFinished) {
      return;
    }

    if ([[WDAudioEventLoop sharedEventLoop] currentStreamer] != self) {
      [[WDAudioEventLoop sharedEventLoop] pause];
      [[WDAudioEventLoop sharedEventLoop] setCurrentStreamer:self];
    }

    [[WDAudioEventLoop sharedEventLoop] play];
  }
}

- (void)pause
{
  @synchronized(self) {
    if (_status == WDAudioStreamerPaused ||
        _status == WDAudioStreamerIdle ||
        _status == WDAudioStreamerFinished) {
      return;
    }

    if ([[WDAudioEventLoop sharedEventLoop] currentStreamer] != self) {
      return;
    }

    [[WDAudioEventLoop sharedEventLoop] pause];
  }
}

- (void)stop
{
  @synchronized(self) {
    if (_status == WDAudioStreamerIdle) {
      return;
    }

    if ([[WDAudioEventLoop sharedEventLoop] currentStreamer] != self) {
      return;
    }

    [[WDAudioEventLoop sharedEventLoop] stop];
    [[WDAudioEventLoop sharedEventLoop] setCurrentStreamer:nil];
  }
}

@end
