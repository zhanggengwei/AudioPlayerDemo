//
//  WDAudioStreamer+Options.m
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAudioStreamer+Options.h"

NSString *const kWDAudioStreamerVolumeKey = @"WDAudioStreamerVolume";
const NSUInteger kWDAudioStreamerBufferTime = 200;

static WDAudioStreamerOptions gOptions = WDAudioStreamerDefaultOptions;

@implementation WDAudioStreamer (Options)

+ (WDAudioStreamerOptions)options
{
  return gOptions;
}

+ (void)setOptions:(WDAudioStreamerOptions)options
{
  if (!!((gOptions ^ options) & WDAudioStreamerKeepPersistentVolume) &&
      !(options & WDAudioStreamerKeepPersistentVolume)) {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kWDAudioStreamerVolumeKey];
  }

  gOptions = options;
}

@end
