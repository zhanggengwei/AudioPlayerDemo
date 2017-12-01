//
//  WDAudioAnalyzer.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kWDAudioAnalyzerLevelCount 20

@interface WDAudioAnalyzer : NSObject

+ (instancetype)analyzer;

- (void)handleLPCMSamples:(int16_t *)samples count:(NSUInteger)count;
- (void)flush;

- (void)copyLevels:(float *)levels;

@property (nonatomic, assign) NSTimeInterval interval;
@property (nonatomic, assign, getter=isEnabled) BOOL enabled;

@end
