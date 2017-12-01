//
//  WDAudioAnalyzer+Default.m
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAudioAnalyzer+Default.h"
#import "WDAudioSpatialAnalyzer.h"
#import "WDAudioFrequencyAnalyzer.h"

@implementation WDAudioAnalyzer (Default)

+ (instancetype)spatialAnalyzer
{
  return [WDAudioSpatialAnalyzer analyzer];
}

+ (instancetype)frequencyAnalyzer
{
  return [WDAudioFrequencyAnalyzer analyzer];
}

@end
