//
//  WDAudioLPCM.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDAudioLPCM : NSObject

@property (nonatomic, assign, getter=isEnd) BOOL end;

- (BOOL)readBytes:(void **)bytes length:(NSUInteger *)length;
- (void)writeBytes:(const void *)bytes length:(NSUInteger)length;

@end
