//
//  WDTrackItem+items.h
//  AudioPlayerDemo
//
//  Created by VD on 2017/12/1.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDTrackItem.h"

@interface WDTrackItem (items)

+ (NSArray *)remoteTracks;
+ (NSArray *)localTracks;
+ (NSArray *)musicLibraryTracks;

@end
