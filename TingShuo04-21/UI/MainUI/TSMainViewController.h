//
//  TSMainViewController.h
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSReleaseViewController.h"
#import "User.h"

@interface TSMainViewController : UITableViewController <RenrenDelegate>
{
    Renren *_renren;
    User *_user;
}

@property (strong, nonatomic) TSReleaseViewController *releaseViewController;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) NSMutableArray *mainArr;
@property (strong, nonatomic) NSMutableDictionary *singleMsgChatDic;

@property (retain, nonatomic) Renren *renren;
@property (retain, nonatomic) User *user;


@end
