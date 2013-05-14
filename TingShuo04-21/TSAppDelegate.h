//
//  TSAppDelegate.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-4-21.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSViewController;

@interface TSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TSViewController *tsViewController;

@property (strong, nonatomic) UINavigationController *navController;

@end
