//
//  TSMsgChatCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-23.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MsgChat;

@interface TSMsgChatCell : UITableViewCell

@property (nonatomic, strong) MsgChat *msgChat;
@property (nonatomic, strong) NSDictionary *msgChatDic;


+ (CGFloat)heightForCellWithMsgChat:(NSDictionary *)msgChatDic;

- (void)updateMsgChatDic:(NSDictionary *)msgChatDic;


@end
