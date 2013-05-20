//
//  TSShareCommentDingView.m
//  TingShuo04-21
//  顶 评论 分享
//  Created by 张 璐 on 13-5-17.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSShareCommentDingView.h"

@implementation TSShareCommentDingView
@synthesize shareBtn = _shareBtn;
@synthesize commentBtn = _commentBtn;
@synthesize dingBtn = _dingBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _dingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _dingBtn.frame = CGRectMake(0, 0, 30, 20);
        //[_dingBtn setBackgroundImage:image forState:UIControlStateNormal];
        [_dingBtn setBackgroundColor:[ UIColor blackColor]];
        [_dingBtn setTitle:@"顶" forState:UIControlStateNormal];
        [_dingBtn addTarget:self action:@selector(dingClickHandler) forControlEvents:UIControlEventTouchUpInside];
        //[self addSubview:_submitBtn];
        
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentBtn.frame = CGRectMake(30, 0, 30, 20);
        //[_commentBtn setBackgroundImage:image forState:UIControlStateNormal];
        [_commentBtn setBackgroundColor:[ UIColor blackColor]];
        [_commentBtn setTitle:@"评" forState:UIControlStateNormal];
        [_commentBtn addTarget:self action:@selector(commentClickHandler) forControlEvents:UIControlEventTouchUpInside];
        //[self addSubview:_commentBtn];
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.frame = CGRectMake(60, 0, 30, 20);
        [_shareBtn setBackgroundColor:[ UIColor blackColor]];
        [_shareBtn setTitle:@"分" forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareClickHandler) forControlEvents:UIControlEventTouchUpInside];
        //[self addSubview:_shareBtn];
    }
    return self;
}

//初始化按钮，1：“顶评论分享” 2：“顶”
-(void)initButton:(int)index
{
    switch (index) {
        case 1:
            [self addSubview:_shareBtn];
            [self addSubview:_commentBtn];
            [self addSubview:_dingBtn];
            break;
            
        default:
            [self addSubview:_dingBtn];
            break;
    }
}

-(void)dingClickHandler
{
    if([self.delegate respondsToSelector:@selector(shareCommtetDing:)])
    {
        [self.delegate shareCommtetDing:3];
    }
}

-(void)commentClickHandler
{
    if([self.delegate respondsToSelector:@selector(shareCommtetDing:)])
    {
        [self.delegate shareCommtetDing:2];
    }
}

-(void)shareClickHandler
{
    if([self.delegate respondsToSelector:@selector(shareCommtetDing:)])
    {
        [self.delegate shareCommtetDing:1];
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
