//
//  TSMainListViewController.h
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Post;
//发布窗体
@interface TSMainListViewController : UITableViewCell

@property (nonatomic, strong) Post *post;

+ (CGFloat)heightForCellWithPost:(Post *)post;

@end
