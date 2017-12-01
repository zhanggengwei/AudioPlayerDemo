//
//  WDAudioEventLoop.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//
#import <Foundation/Foundation.h>

@class WDAudioStreamer;

@interface WDAudioEventLoop : NSObject

+ (instancetype)sharedEventLoop;

@property (nonatomic, strong) WDAudioStreamer *currentStreamer;

@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, assign) double volume;

@property (nonatomic, copy) NSArray *analyzers;

- (void)play;
- (void)pause;
- (void)stop;

@end
