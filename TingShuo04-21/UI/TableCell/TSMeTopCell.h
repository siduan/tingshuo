//
//  TSMeTopCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-6.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSMeTopCell : UITableViewCell

@property (nonatomic, strong) UIImageView *bgImg;//
@property (nonatomic, strong) UIImageView *headImg;//
@property (nonatomic, strong) UILabel *nameTextLabel;//名字
@property (nonatomic, strong) UILabel *renqiTextLabel;//人气，后期改为按钮，点击显示浏览者头像
@property (nonatomic, strong) UILabel *signInTextLabel;//签名

//更新内容
- (void)updateContents:(NSArray *)conArr;
+ (CGFloat)heightForCell:(NSDictionary *)contentDic;

@end
