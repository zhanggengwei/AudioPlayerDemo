//
//  WDTrackItem.h
//  AudioPlayerDemo
//
//  Created by VD on 2017/12/1.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDAudioFile.h"

@interface WDTrackItem : NSObject<WDAudioFile>

@property (nonatomic,strong) NSURL * audioFileURL;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * artist;


@end
