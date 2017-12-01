//
//  WDAudioSpatialAnalyzer.m
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAudioSpatialAnalyzer.h"
#import "WDAudioAnalyzer_Private.h"

@implementation WDAudioSpatialAnalyzer

- (void)processChannelVectors:(const float *)vectors toLevels:(float *)levels
{
  for (size_t i = 0; i < kWDAudioAnalyzerLevelCount; ++i) {
    levels[i] = vectors[kWDAudioAnalyzerCount * i / kWDAudioAnalyzerLevelCount];
  }
}

@end
