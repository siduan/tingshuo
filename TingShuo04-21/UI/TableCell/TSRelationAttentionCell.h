//
//  TSRelationAttentionCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"
#import "TSPersonIntroUIView.h"

@protocol TSRelationAttentionCellDelegate;

@interface TSRelationAttentionCell : UITableViewCell<TSPersonIntroDelegate>

@property (nonatomic, retain) id <TSRelationAttentionCellDelegate> delegate;

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

@property (nonatomic, strong) UILabel *attentionTextLabel;//双向关注 未关注
@property (nonatomic, strong) UIButton *sendMsgButton;//发信


//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end

@protocol TSRelationAttentionCellDelegate <NSObject>
-(void)openAttention:(NSString *)qunId;
-(void)imageViewClick:(NSString *)qunId;
@end
