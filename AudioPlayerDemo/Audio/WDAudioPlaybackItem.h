//
//  WDAudioPlaybackItem.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CoreAudio/CoreAudioTypes.h>
#include <AudioToolbox/AudioToolbox.h>

@class WDAudioFileProvider;
@class WDAudioFilePreprocessor;
@protocol WDAudioFile;

@interface WDAudioPlaybackItem : NSObject

+ (instancetype)playbackItemWithFileProvider:(WDAudioFileProvider *)fileProvider;
- (instancetype)initWithFileProvider:(WDAudioFileProvider *)fileProvider;

@property (nonatomic, readonly) WDAudioFileProvider *fileProvider;
@property (nonatomic, readonly) WDAudioFilePreprocessor *filePreprocessor;
@property (nonatomic, readonly) id <WDAudioFile> audioFile;

@property (nonatomic, readonly) NSURL *cachedURL;
@property (nonatomic, readonly) NSData *mappedData;

@property (nonatomic, readonly) AudioFileID fileID;
@property (nonatomic, readonly) AudioStreamBasicDescription fileFormat;
@property (nonatomic, readonly) NSUInteger bitRate;
@property (nonatomic, readonly) NSUInteger dataOffset;
@property (nonatomic, readonly) NSUInteger estimatedDuration;

@property (nonatomic, readonly, getter=isOpened) BOOL opened;

- (BOOL)open;
- (void)close;

@end
