//
//  TSPersonIntroUIView.h
//  TingShuo04-21
//  个人简介
//  Created by 张 璐 on 13-5-10.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TSPersonIntroDelegate;

@interface TSPersonIntroUIView : UIView

@property (nonatomic, retain) id <TSPersonIntroDelegate> delegate;

@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIImageView *headImg;//
@property (nonatomic, strong) UILabel *nameTextLabel;//名字
@property (nonatomic, strong) UILabel *accountTextLabel;//听说账号
@property (nonatomic, strong) UILabel *schoolTextLabel;//学校
@property (nonatomic, strong) UILabel *birthdayTextLabel;//生日

@property (nonatomic, strong) UILabel *attentionTextLabel;//关注
@property (nonatomic, strong) UILabel *fensiTextLabel;//粉丝
@property (nonatomic, strong) UILabel *mingyanTextLabel;//明言
@property (nonatomic, strong) UILabel *anyuTextLabel;//暗语
@property (nonatomic, strong) UILabel *intrestTextLabel;//兴趣爱好

@property (nonatomic, strong) UIButton *changeInfoBtn;//修改信息

//更新内容
- (void)updateContents:(NSArray *)conArr;

- (void)showAnimation;
//关闭面板按钮
-(void)doCloseSelected;

@end

@protocol TSPersonIntroDelegate <NSObject>
//-(void)closeBtnCallBack;
-(void)changeInfoCallBack;
@end
