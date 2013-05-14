//
//  TSMainQunCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-30.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"

@interface TSMainQunCell : UITableViewCell

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

@property (nonatomic, strong) UILabel *timeTextLabel;

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)mainDic;
- (void)updateMsgReplyDic:(NSDictionary *)mainDic;
@end
