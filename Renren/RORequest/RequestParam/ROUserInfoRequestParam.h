//  ROUserInfoRequestParam.h
//  Renren Open-platform
//
//  Created by xiawenhai on 11-8-12.
//  Copyright 2011年 Renren Inc. All rights reserved.
//  - Powered by Team Pegasus. -
//
#import <Foundation/Foundation.h>
#import "RORequestParam.h"

/**
 *封装了用户信息请求参数的类
 */
@interface ROUserInfoRequestParam : RORequestParam {
	NSString *_userIDs;
	NSString *_fields;
}

/**
 *用户的ID。多个ID,以逗号分隔,缺省值为access_token对应用户的id
 */
@property (copy,nonatomic)NSString *userIDs;

/**
 *请求的字段，可以指定返回那些字段，用逗号分隔如：name,sex,headurl
 */
@property (copy,nonatomic)NSString *fields;

@end
