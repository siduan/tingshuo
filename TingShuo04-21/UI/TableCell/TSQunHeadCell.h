//
//  TSQunHeadCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"

@interface TSQunHeadCell : UITableViewCell

@property (nonatomic, strong) UILabel *fensiTextLabel;
@property (nonatomic, strong) UILabel *msgTextLabel;

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end
