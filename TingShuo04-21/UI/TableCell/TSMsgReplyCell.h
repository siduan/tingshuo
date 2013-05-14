//
//  TSMsgReplyCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-28.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"
//消息--回复
@interface TSMsgReplyCell : UITableViewCell
{
    UILabel *replyTextLabel;
}

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *msgReplyDic;

@property (nonatomic, strong) UILabel *replyTextLabel;
@property (nonatomic, strong) UILabel *timeTextLabel;

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)msgReplyDic;
- (void)updateMsgReplyDic:(NSDictionary *)msgReplyDic;
@end
