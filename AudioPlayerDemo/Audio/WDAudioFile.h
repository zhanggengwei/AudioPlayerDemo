//
//  WDAudioFile.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDAudioFilePreprocessor;

@protocol WDAudioFile <NSObject>

@required

- (NSURL *)audioFileURL;

@optional

- (NSString *)audioFileHost;
- (WDAudioFilePreprocessor *)audioFilePreprocessor;

@end
