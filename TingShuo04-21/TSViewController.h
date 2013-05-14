//
//  TSViewController.h
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-8.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordFlowLoginViewController.h"
#import "TSMainViewController.h"
#import "TSRelationViewController.h"
#import "TSMsgViewController.h"
#import "TSMeViewController.h"
#import "TSTabBarViewController.h"
#import "TSMainListViewController.h"

@interface TSViewController : UIViewController <RenrenDelegate>
{
    Renren *_renren;
}

@property (retain,nonatomic)Renren *renren;
@property (retain, nonatomic) User *user;
@property (nonatomic , retain) IBOutlet UIButton *button;
@property (strong, nonatomic) PasswordFlowLoginViewController *passwordFlowLoginViewController;

@property (strong, nonatomic) TSMainViewController *mainViewController;
@property (strong, nonatomic) TSMsgViewController *msgViewController;
@property (strong, nonatomic) TSRelationViewController *relationViewController;
@property (strong, nonatomic) TSMeViewController *meViewController;


-(IBAction)buttonOnclick:(id)sender;

@end
