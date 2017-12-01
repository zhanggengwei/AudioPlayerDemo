//
//  WDEAGLView.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface WDEAGLView : UIView

@property (nonatomic, getter=isPaused) BOOL paused;
@property (nonatomic, assign) NSInteger frameInterval;

- (void)prepare;
- (void)cleanup;

- (void)reshape;
- (void)render;

@end

#endif /* TARGET_OS_IPHONE */
