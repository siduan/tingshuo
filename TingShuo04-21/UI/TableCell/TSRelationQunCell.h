//
//  TSRelationQunCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgChat.h"

@protocol TSRelationQunCellDelegate;

@interface TSRelationQunCell : UITableViewCell


@property (nonatomic, retain) id <TSRelationQunCellDelegate> delegate;

@property (nonatomic, strong) MsgChat *msgReply;
@property (nonatomic, strong) NSDictionary *mainDic;

@property (nonatomic, strong) UILabel *fensiTextLabel;
@property (nonatomic, strong) UILabel *msgTextLabel;

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end

@protocol TSRelationQunCellDelegate <NSObject>
-(void)openSomething:(NSString *)qunId;//暂时搁置不用
@end
