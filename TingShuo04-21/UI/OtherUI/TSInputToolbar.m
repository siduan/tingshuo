//
//  TSInputToolbar.m
//  TingShuo04-21
//  像聊天那样的输入框
//  Created by 张 璐 on 13-5-17.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSInputToolbar.h"

@implementation TSInputToolbar
@synthesize inputText = _inputText;
@synthesize submitBtn = _submitBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"backitem.png"];
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(270, 0, image.size.width, image.size.height);
        [_submitBtn setBackgroundImage:image forState:UIControlStateNormal];
        [_submitBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(submitClickHandler) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_submitBtn];
        
        _inputText = [[[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 250.0f, 40.0f)] autorelease];
        [self addSubview:_inputText];
    }
    return self;
}


-(void) openInput
{
    [_inputText resignFirstResponder];
}
//提交内容，这是需要隐藏self，
-(void) submitClickHandler
{
    
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
