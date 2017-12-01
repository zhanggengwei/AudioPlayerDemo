//
//  WDAudioDecoder.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CoreAudio/CoreAudioTypes.h>

typedef NS_ENUM(NSUInteger, WDAudioDecoderStatus) {
  WDAudioDecoderSucceeded,
  WDAudioDecoderFailed,
  WDAudioDecoderEndEncountered,
  WDAudioDecoderWaiting
};

@class WDAudioPlaybackItem;
@class WDAudioLPCM;

@interface WDAudioDecoder : NSObject

+ (AudioStreamBasicDescription)defaultOutputFormat;

+ (instancetype)decoderWithPlaybackItem:(WDAudioPlaybackItem *)playbackItem
                             bufferSize:(NSUInteger)bufferSize;

- (instancetype)initWithPlaybackItem:(WDAudioPlaybackItem *)playbackItem
                          bufferSize:(NSUInteger)bufferSize;

- (BOOL)setUp;
- (void)tearDown;

- (WDAudioDecoderStatus)decodeOnce;
- (void)seekToTime:(NSUInteger)milliseconds;

@property (nonatomic, readonly) WDAudioPlaybackItem *playbackItem;
@property (nonatomic, readonly) WDAudioLPCM *lpcm;

@end
