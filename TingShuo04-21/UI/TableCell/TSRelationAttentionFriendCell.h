//
//  TSRelationAttentionFriendCell.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-23.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Post;

@interface TSRelationAttentionFriendCell : UITableViewCell

@property (nonatomic, strong) Post *post;

+ (CGFloat)heightForCellWithPost:(Post *)post;

@end
