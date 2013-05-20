//
//  TSReplyheadCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"

@interface TSReplyheadCell : UITableViewCell

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

@property (nonatomic, strong) UILabel *replyTextLabel;
@property (nonatomic, strong) UILabel *timeTextLabel;

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)mainDic;
- (void)updateContents:(NSDictionary *)mainDic;

@end
