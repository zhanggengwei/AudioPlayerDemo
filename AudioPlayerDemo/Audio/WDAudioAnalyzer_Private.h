//
//  WDAudioAnalyzer_Private
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAudioAnalyzer.h"

#define kWDAudioAnalyzerSampleCount 1024
#define kWDAudioAnalyzerCount (kWDAudioAnalyzerSampleCount / 2)

@interface WDAudioAnalyzer ()

- (void)processChannelVectors:(const float *)vectors toLevels:(float *)levels;

@end
