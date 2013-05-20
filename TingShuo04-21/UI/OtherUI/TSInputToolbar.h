//
//  TSInputToolbar.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-17.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSInputToolbar : UIView

@property (nonatomic, retain) UITextField *inputText;
@property (nonatomic, retain) UIButton *submitBtn;

-(void) openInput;//打开输入，键盘


@end
