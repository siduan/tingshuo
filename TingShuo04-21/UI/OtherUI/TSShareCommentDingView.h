//
//  TSShareCommentDingView.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-17.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TSShareCommentDingViewDelegate;

@interface TSShareCommentDingView : UIView

@property (nonatomic, retain) id <TSShareCommentDingViewDelegate> delegate;

@property (nonatomic, retain) UIButton *shareBtn;
@property (nonatomic, retain) UIButton *commentBtn;
@property (nonatomic, retain) UIButton *dingBtn;
//初始化按钮，1：“顶评论分享” 2：“顶”
-(void)initButton:(int)index;

@end

@protocol TSShareCommentDingViewDelegate <NSObject>
-(void)shareCommtetDing:(int)index;//判断点击了那个按钮1；share 2;comment 3;ding
@end
