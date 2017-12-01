//
//  WDAudioStreamer+Options.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//
#import "WDAudioStreamer.h"

WDAS_EXTERN NSString *const kWDAudioStreamerVolumeKey;
WDAS_EXTERN const NSUInteger kWDAudioStreamerBufferTime;

typedef NS_OPTIONS(NSUInteger, WDAudioStreamerOptions) {
  WDAudioStreamerKeepPersistentVolume = 1 << 0,
  WDAudioStreamerRemoveCacheOnDeallocation = 1 << 1,
  WDAudioStreamerRequireSHA256 = 1 << 2,

  WDAudioStreamerDefaultOptions = WDAudioStreamerKeepPersistentVolume |
                                   WDAudioStreamerRemoveCacheOnDeallocation
};

@interface WDAudioStreamer (Options)

+ (WDAudioStreamerOptions)options;
+ (void)setOptions:(WDAudioStreamerOptions)options;

@end
