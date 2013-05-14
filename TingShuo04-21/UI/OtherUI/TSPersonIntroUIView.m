//
//  TSPersonIntroUIView.m
//  TingShuo04-21
//  个人简介
//  Created by 张 璐 on 13-5-10.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSPersonIntroUIView.h"

@implementation TSPersonIntroUIView

@synthesize closeBtn = _closeBtn;
@synthesize headImg = _headImg;
@synthesize nameTextLabel = _nameTextLabel;
@synthesize accountTextLabel = _accountTextLabel;
@synthesize schoolTextLabel = _schoolTextLabel;
@synthesize  birthdayTextLabel = _birthdayTextLabel;

@synthesize attentionTextLabel = _attentionTextLabel;
@synthesize fensiTextLabel = _fensiTextLabel;
@synthesize mingyanTextLabel = _mingyanTextLabel;
@synthesize anyuTextLabel = _anyuTextLabel;
@synthesize intrestTextLabel = _intrestTextLabel;

@synthesize changeInfoBtn = _changeInfoBtn;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.frame = CGRectMake(20.0f, 60.0f, 280.0f, 460.0f);
        self.layer.borderWidth = 5.0f;
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.backgroundColor = [UIColor grayColor];
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6, 0.6);
        
        [self initContent];
    }
    return self;
}
//初始化内容
- (void)initContent
{
    _headImg = [[UIImageView alloc] init];
    [self addSubview:_headImg];
    
    _closeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _closeBtn.backgroundColor = [UIColor clearColor];
    [_closeBtn setTitle:@"发信" forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(doCloseSelected) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_closeBtn];
    
    _nameTextLabel = [[UILabel alloc] init];
    _nameTextLabel.textColor = [ UIColor blackColor];
    _nameTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _nameTextLabel.numberOfLines = 1;
    [self addSubview:_nameTextLabel];
    
    _accountTextLabel = [[UILabel alloc] init];
    _accountTextLabel.textColor = [ UIColor blackColor];
    _accountTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _accountTextLabel.numberOfLines = 1;
    [self addSubview:_accountTextLabel];
    
    _schoolTextLabel = [[UILabel alloc] init];
    _schoolTextLabel.textColor = [ UIColor blackColor];
    _schoolTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _schoolTextLabel.numberOfLines = 1;
    [self addSubview:_schoolTextLabel];
    
    _birthdayTextLabel = [[UILabel alloc] init];
    _birthdayTextLabel.textColor = [ UIColor blackColor];
    _birthdayTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _birthdayTextLabel.numberOfLines = 1;
    [self addSubview:_birthdayTextLabel];
    
    _attentionTextLabel = [[UILabel alloc] init];
    _attentionTextLabel.textColor = [ UIColor blackColor];
    _attentionTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _attentionTextLabel.numberOfLines = 1;
    [self addSubview:_attentionTextLabel];
    
    _fensiTextLabel = [[UILabel alloc] init];
    _fensiTextLabel.textColor = [ UIColor blackColor];
    _fensiTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _fensiTextLabel.numberOfLines = 1;
    [self addSubview:_fensiTextLabel];
    
    _mingyanTextLabel = [[UILabel alloc] init];
    _mingyanTextLabel.textColor = [ UIColor blackColor];
    _mingyanTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _mingyanTextLabel.numberOfLines = 1;
    [self addSubview:_mingyanTextLabel];
    
    _anyuTextLabel = [[UILabel alloc] init];
    _anyuTextLabel.textColor = [ UIColor blackColor];
    _anyuTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _anyuTextLabel.numberOfLines = 1;
    [self addSubview:_anyuTextLabel];
    
    _intrestTextLabel = [[UILabel alloc] init];
    _intrestTextLabel.textColor = [ UIColor blackColor];
    _intrestTextLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    _intrestTextLabel.numberOfLines = 1;
    [self addSubview:_intrestTextLabel];
    
    _changeInfoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _changeInfoBtn.backgroundColor = [UIColor clearColor];
    [_changeInfoBtn setTitle:@"修改信息" forState:UIControlStateNormal];
    [_changeInfoBtn addTarget:self action:@selector(doChangeInfoSelected) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_changeInfoBtn];
    
    _closeBtn.frame = CGRectMake(250.0f, 5.0f, 20.0f, 20.0f);
    _headImg.frame = CGRectMake(60.0f, 15.0f, 150.0f, 150.0f);
    _nameTextLabel.frame = CGRectMake(30.0f, 170.0f, 100.0f, 20.0f);
    _accountTextLabel.frame = CGRectMake(150.0f, 170.f, 100.0f, 20.0f);
    _schoolTextLabel.frame = CGRectMake(20.0f, 200.0f, 100.0f, 20.0f);
    _birthdayTextLabel.frame = CGRectMake(150.0f, 200.0f, 100.0f, 20.0f);
    _attentionTextLabel.frame = CGRectMake(10.0f, 240.0f, 60.0f, 20.0f);
    _fensiTextLabel.frame = CGRectMake(70.0f, 240.0f, 60.0f, 20.0f);
    _mingyanTextLabel.frame = CGRectMake(130.0f, 240.0f, 60.0f, 20.0f);
    _anyuTextLabel.frame = CGRectMake(190.0f, 240.0f, 60.0f, 20.0f);
    _intrestTextLabel.frame = CGRectMake(10.0f, 260.0f, 250.0f, 20.0f);
    _changeInfoBtn.frame = CGRectMake(80.0f, 290.0f, 100.0f, 25.0f);
}

//更新内容
- (void)updateContents:(NSArray *)conArr
{
    [_headImg setImageWithURL:[NSURL URLWithString:@"http://hdn.xnimg.cn/photos/hdn421/20130502/0955/h_head_Y0jz_e6d0000007a3111a.jpg"] placeholderImage:[UIImage imageNamed:@"Icon.png"]];
    
    _nameTextLabel.text = @"陈默默";
    _accountTextLabel.text = @"听说账号5211314";
    _schoolTextLabel.text = @"人民大学附属高中11级12班";
    _birthdayTextLabel.text = @"1995年1月12日";
    _attentionTextLabel.text = @"关注 1211人";
    _fensiTextLabel.text = @"粉丝 12441人";
    _mingyanTextLabel.text = @"明言 124";
    _anyuTextLabel.text = @"暗语 121";
    _intrestTextLabel.text = @"兴趣爱好 篮球 游泳 dota 笑";
    
}
//播放动画
- (void)showAnimation
{
    
    [UIView animateWithDuration:0.2 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.1f, 1.1f);
         self.alpha = 0.5;
     }
                     completion:^(BOOL finished){
                         [self bounceOutAnimationStoped];
                     }];
}
- (void)bounceOutAnimationStoped
{
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9, 0.9);
         self.alpha = 0.8;
     }
                     completion:^(BOOL finished){
                         [self bounceInAnimationStoped];
                     }];
}
- (void)bounceInAnimationStoped
{
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
         self.alpha = 1.0;
     }
                     completion:^(BOOL finished){
                         [self animationStoped];
                     }];
}
- (void)animationStoped
{
    
}

//关闭按钮
-(void)doCloseSelected
{
    self.alpha = 0;
    self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6, 0.6);
    
    [self removeFromSuperview];
    
}
//修改信息按钮
-(void)doChangeInfoSelected
{
    if([self.delegate respondsToSelector:@selector(changeInfoCallBack:)])
    {
        [self.delegate changeInfoCallBack];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
