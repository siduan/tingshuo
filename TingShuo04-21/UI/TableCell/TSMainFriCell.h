//
//  TSMainFriCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-30.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"

@protocol TSMainFriendsCellDelegate;

@interface TSMainFriCell : UITableViewCell

@property (nonatomic, retain) id <TSMainFriendsCellDelegate> delegate;

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

//@property (nonatomic, strong) UILabel *replyTextLabel;
@property (nonatomic, strong) UILabel *timeTextLabel;

@property (nonatomic, strong) NSMutableArray *replyTextArr;

+ (CGFloat)heightForCellWithMsgReply:(NSDictionary *)mainDic;
- (void)updateMsgReplyDic:(NSDictionary *)mainDic;
- (void)updateReply:(NSString *)mainStr;//更新回复
@end

@protocol TSMainFriendsCellDelegate <NSObject>
-(void)replyHandler:(NSString *)nameStr;
@end

