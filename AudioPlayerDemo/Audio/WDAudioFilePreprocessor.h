//
//  WDAudioFilePreprocessor.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDAudioFilePreprocessor : NSObject

- (NSData *)handleData:(NSData *)data offset:(NSUInteger)offset;

@end
