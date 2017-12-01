//
//  WDAudioVisualizer.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//
#if TARGET_OS_IPHONE

#import "WDEAGLView.h"

typedef NS_ENUM(NSUInteger, WDAudioVisualizerInterpolationType) {
  WDAudioVisualizerLinearInterpolation,
  WDAudioVisualizerSmoothInterpolation
};

@interface WDAudioVisualizer : WDEAGLView

@property (nonatomic, assign) NSUInteger stepCount;
@property (nonatomic, assign) WDAudioVisualizerInterpolationType interpolationType;

@end

#endif /* TARGET_OS_IPHONE */
