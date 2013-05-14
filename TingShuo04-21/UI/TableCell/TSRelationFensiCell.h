//
//  TSRelationFensiCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"

@protocol TSRelationFensiCellDelegate;

@interface TSRelationFensiCell : UITableViewCell

@property (nonatomic, retain) id <TSRelationFensiCellDelegate> delegate;

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

@property (nonatomic, strong) UILabel *attentionTextLabel;//双向关注 未关注
@property (nonatomic, strong) UIButton *sendMsgButton;//发信

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end

@protocol TSRelationFensiCellDelegate <NSObject>
-(void)openFensi:(NSString *)qunId;
-(void)imageViewFensiClick:(NSString *)qunId;
@end
