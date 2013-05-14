//
//  TSTieziContentCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSTieziContentCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameTextLabel;//某人
@property (nonatomic, strong) UILabel *replyTextLabel;//回复：某条评论的第一行
@property (nonatomic, strong) UILabel *timeTextLabel;//时间
@property (nonatomic, strong) UILabel *contentTextLabel;//发布的内容

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end
