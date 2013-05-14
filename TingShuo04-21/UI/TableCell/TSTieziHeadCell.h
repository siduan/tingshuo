//
//  TSTieziHeadCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TSTieziHeadCellDelegate;

@interface TSTieziHeadCell : UITableViewCell

@property (nonatomic, retain) id <TSTieziHeadCellDelegate> delegate;

@property (nonatomic, strong) UILabel *themeTextLabel;//帖子的题目
@property (nonatomic, strong) UILabel *searchTimesTextLabel;//浏览次数xxx次
@property (nonatomic, strong) UILabel *timeTextLabel;//时间
@property (nonatomic, strong) UILabel *contentTextLabel;//帖子内容

@property (nonatomic, strong) UIButton *newestButton;//“最新”
@property (nonatomic, strong) UIButton *hotestButton;//“最热”

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;


@end

@protocol TSTieziHeadCellDelegate <NSObject>
-(void)switchNeworHot:(BOOL)isNew;
@end
