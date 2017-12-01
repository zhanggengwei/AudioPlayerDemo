//
//  WDAudioStreamer.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAudioStreamer.h"

@class WDAudioFileProvider;
@class WDAudioPlaybackItem;
@class WDAudioDecoder;

@interface WDAudioStreamer ()

@property (assign) WDAudioStreamerStatus status;
@property (strong) NSError *error;

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSInteger timingOffset;

@property (nonatomic, readonly) WDAudioFileProvider *fileProvider;
@property (nonatomic, strong) WDAudioPlaybackItem *playbackItem;
@property (nonatomic, strong) WDAudioDecoder *decoder;

@property (nonatomic, assign) double bufferingRatio;

#if TARGET_OS_IPHONE
@property (nonatomic, assign, getter=isPausedByInterruption) BOOL pausedByInterruption;
#endif /* TARGET_OS_IPHONE */

@end
