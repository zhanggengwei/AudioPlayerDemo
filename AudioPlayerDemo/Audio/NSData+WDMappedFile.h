//
//  NSData+WDMappedFile.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (WDMappedFile)

+ (instancetype)wd_dataWithMappedContentsOfFile:(NSString *)path;
+ (instancetype)wd_dataWithMappedContentsOfURL:(NSURL *)url;

+ (instancetype)wd_modifiableDataWithMappedContentsOfFile:(NSString *)path;
+ (instancetype)wd_modifiableDataWithMappedContentsOfURL:(NSURL *)url;

- (void)wd_synchronizeMappedFile;

@end
