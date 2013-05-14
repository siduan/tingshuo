//
//  TSRelationAttentionFriendCell.m
//  TingShuo04-21
//
//  Created by �� � on 13-4-23.
//  Copyright (c) 2013�� ���Ƹ�. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AFNetDataCacheManager : NSObject
{
    NSMutableDictionary * cacheDic;
    NSMutableArray * cacheArray;
}

-(id) init;

//��ȡ��URL�µ�ͼƬ��������Ϣ��ͨ�� HHNetDataCacheNotification ����
//���ص�����Ϊһ��Dic��key HHNetDataCacheURLKey Ϊ ����ʱ��url�� HHNetDataCacheData Ϊ���ݣ��ṹ��NSData
//�ο�HHPopVC���÷�
-(void) getDataWithURL:(NSString *) url;
-(void) getDataWithURL:(NSString *) url withIndex:(NSInteger)index;

-(void) freeMemory;

+(AFNetDataCacheManager *) getInstance;

@end