//
//  TSQunTopTenCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSQunTopTenCell : UITableViewCell

@property (nonatomic, strong) UILabel *topTextLabel;//“本周TOP1”...
@property (nonatomic, strong) UILabel *searchTimesTextLabel;//浏览次数xxx次
@property (nonatomic, strong) UILabel *timeTextLabel;//时间
@property (nonatomic, strong) UILabel *contentTextLabel;//帖子内容

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end
