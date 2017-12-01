//
//  WDAudioRenderer.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDAudioRenderer : NSObject

+ (instancetype)rendererWithBufferTime:(NSUInteger)bufferTime;
- (instancetype)initWithBufferTime:(NSUInteger)bufferTime;

- (BOOL)setUp;
- (void)tearDown;

- (void)renderBytes:(const void *)bytes length:(NSUInteger)length;
- (void)stop;
- (void)flush;
- (void)flushShouldResetTiming:(BOOL)shouldResetTiming;

@property (nonatomic, readonly) NSUInteger currentTime;
@property (nonatomic, readonly, getter=isStarted) BOOL started;
@property (nonatomic, assign, getter=isInterrupted) BOOL interrupted;
@property (nonatomic, assign) double volume;

@property (nonatomic, copy) NSArray *analyzers;

@end
