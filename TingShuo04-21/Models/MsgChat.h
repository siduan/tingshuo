//
//  MsgChat.h
//  TingShuo4-9
//
//  Created by ’≈ Ë¥ on 13-4-14.
//  Copyright (c) 2013ƒÍ ÀÔ‘∆∏ﬂ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface MsgChat : NSObject

@property (nonatomic) NSUInteger chatID;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *content;


- (id)initWithAttributes:(NSDictionary *)attributes;

+ (void)globalTimelineMsgChatWithBlock:(void (^)(NSDictionary *chats, NSError *error))block;

@end