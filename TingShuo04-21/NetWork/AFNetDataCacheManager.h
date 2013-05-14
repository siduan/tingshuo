//
//  TSRelationAttentionFriendCell.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-23.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AFNetDataCacheManager : NSObject
{
    NSMutableDictionary * cacheDic;
    NSMutableArray * cacheArray;
}

-(id) init;

//获取此URL下的图片或其他信息，通过 HHNetDataCacheNotification 返回
//返回的内容为一个Dic，key HHNetDataCacheURLKey 为 请求时的url， HHNetDataCacheData 为数据，结构是NSData
//参考HHPopVC的用法
-(void) getDataWithURL:(NSString *) url;
-(void) getDataWithURL:(NSString *) url withIndex:(NSInteger)index;

-(void) freeMemory;

+(AFNetDataCacheManager *) getInstance;

@end