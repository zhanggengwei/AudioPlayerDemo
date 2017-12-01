//
//  WDAudioFileProvider.m
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDAudioBase.h"
#import "WDAudioFile.h"
#import "WDAudioFilePreprocessor.h"
#import "WDAudioAnalyzer+Default.h"

WDAS_EXTERN NSString *const kWDAudioStreamerErrorDomain;

typedef NS_ENUM(NSUInteger, WDAudioStreamerStatus) {
  WDAudioStreamerPlaying,
  WDAudioStreamerPaused,
  WDAudioStreamerIdle,
  WDAudioStreamerFinished,
  WDAudioStreamerBuffering,
  WDAudioStreamerError
};

typedef NS_ENUM(NSInteger, WDAudioStreamerErrorCode) {
  WDAudioStreamerNetworkError,
  WDAudioStreamerDecodingError
};

@interface WDAudioStreamer : NSObject

+ (instancetype)streamerWithAudioFile:(id <WDAudioFile>)audioFile;
- (instancetype)initWithAudioFile:(id <WDAudioFile>)audioFile;

+ (double)volume;
+ (void)setVolume:(double)volume;

+ (NSArray *)analyzers;
+ (void)setAnalyzers:(NSArray *)analyzers;

+ (void)setHintWithAudioFile:(id <WDAudioFile>)audioFile;

@property (assign, readonly) WDAudioStreamerStatus status;
@property (strong, readonly) NSError *error;

@property (nonatomic, readonly) id <WDAudioFile> audioFile;
@property (nonatomic, readonly) NSURL *url;

@property (nonatomic, assign, readonly) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, assign) double volume;

@property (nonatomic, copy) NSArray *analyzers;

@property (nonatomic, readonly) NSString *cachedPath;
@property (nonatomic, readonly) NSURL *cachedURL;

@property (nonatomic, readonly) NSString *sha256;

@property (nonatomic, readonly) NSUInteger expectedLength;
@property (nonatomic, readonly) NSUInteger receivedLength;
@property (nonatomic, readonly) NSUInteger downloadSpeed;
@property (nonatomic, assign, readonly) double bufferingRatio;

- (void)play;
- (void)pause;
- (void)stop;

@end
