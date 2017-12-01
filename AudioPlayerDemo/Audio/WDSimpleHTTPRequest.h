//
//  WDSimpleHTTPRequest.h
//  DOUASDemo
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef void (^WDSimpleHTTPRequestCompletedBlock)(void);
typedef void (^WDSimpleHTTPRequestProgressBlock)(double downloadProgress);
typedef void (^WDSimpleHTTPRequestDidReceiveResponseBlock)(void);
typedef void (^WDSimpleHTTPRequestDidReceiveDataBlock)(NSData *data);

@interface WDSimpleHTTPRequest : NSObject

+ (instancetype)requestWithURL:(NSURL *)url;
- (instancetype)initWithURL:(NSURL *)url;

+ (NSTimeInterval)defaultTimeoutInterval;
+ (NSString *)defaultUserAgent;

@property (nonatomic, assign) NSTimeInterval timeoutInterval;
@property (nonatomic, strong) NSString *userAgent;
@property (nonatomic, strong) NSString *host;

@property (nonatomic, readonly) NSData *responseData;
@property (nonatomic, readonly) NSString *responseString;

@property (nonatomic, readonly) NSDictionary *responseHeaders;
@property (nonatomic, readonly) NSUInteger responseContentLength;
@property (nonatomic, readonly) NSInteger statusCode;
@property (nonatomic, readonly) NSString *statusMessage;

@property (nonatomic, readonly) NSUInteger downloadSpeed;
@property (nonatomic, readonly, getter=isFailed) BOOL failed;

@property (copy) WDSimpleHTTPRequestCompletedBlock completedBlock;
@property (copy) WDSimpleHTTPRequestProgressBlock progressBlock;
@property (copy) WDSimpleHTTPRequestDidReceiveResponseBlock didReceiveResponseBlock;
@property (copy) WDSimpleHTTPRequestDidReceiveDataBlock didReceiveDataBlock;

- (void)start;
- (void)cancel;

@end
