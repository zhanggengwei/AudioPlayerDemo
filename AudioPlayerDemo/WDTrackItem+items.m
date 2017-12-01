//
//  WDTrackItem+items.m
//  AudioPlayerDemo
//
//  Created by VD on 2017/12/1.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDTrackItem+items.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation WDTrackItem (items)
+ (void)load
{
    [self.class remoteTracks];
    [self.class localTracks];
    [self.class musicLibraryTracks];
}
+ (NSArray *)remoteTracks
{
    
    return nil;
}
+ (NSArray *)localTracks
{
    NSArray * items = [self.class audioFilesWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
    NSMutableArray * array = [NSMutableArray new];
    for (NSString * path in items) {
        WDTrackItem *track = [[WDTrackItem alloc] init];
        track.audioFileURL = [NSURL fileURLWithPath:path];
        [array addObject:track];
        
    }
    return array;
}
+ (NSArray *)musicLibraryTracks
{
    static  NSMutableArray * array;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        array = [NSMutableArray new];
        for (MPMediaItem * item in [MPMediaQuery songsQuery].items) {
            WDTrackItem *track = [[WDTrackItem alloc] init];
            [track setArtist:[item valueForProperty:MPMediaItemPropertyArtist]];
            [track setTitle:[item valueForProperty:MPMediaItemPropertyTitle]];
            [track setAudioFileURL:[item valueForProperty:MPMediaItemPropertyAssetURL]];
            [array addObject:track];
        }
    });
    return array;
}

+ (NSArray<NSURL *> *)audioFilesWithPath:(NSString *)path
{
    NSLog(@"audioFile %@",path);
    NSFileManager * defaultManager = [NSFileManager defaultManager];
    NSMutableArray * items = [NSMutableArray new];
    NSError * error;
    NSArray <NSString *> * list = [defaultManager contentsOfDirectoryAtPath:path error:&error];
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //判断是否是目录结构
        BOOL dir;
        NSString * filePath = [path stringByAppendingPathComponent:obj];
        [defaultManager fileExistsAtPath:filePath isDirectory:&dir];
        if(dir)
        {
            NSArray * subItems = [self audioFilesWithPath:filePath];
            [items addObjectsFromArray:subItems];
        }else
        {
            NSArray * extensions = @[@"pcm",@"m4a",@"mp3",@"aac"];
            if([extensions containsObject:obj.pathExtension])
            {
                [items addObject:filePath];
            }
        }
    }];
    return items;
}

@end
