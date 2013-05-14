//
//  TSViewController.m
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-8.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSViewController.h"
#import "PasswordFlowLoginViewController.h"
#import "TSMainViewController.h"
#import "TSRelationViewController.h"
#import "TSMsgViewController.h"
#import "TSMeViewController.h"
#import "TSTabBarViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController
@synthesize renren = _renren;
@synthesize user = _user;
@synthesize button = _button;
@synthesize passwordFlowLoginViewController;

@synthesize mainViewController;
@synthesize msgViewController;
@synthesize relationViewController;
@synthesize meViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doLoginMainScene:) name:@"LoginMainScene" object:nil];
    
     self.renren = [Renren sharedRenren];
}

- (void)dealloc
{
	self.renren = nil;
    self.user = nil;
    self.button = nil;
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//用人人账号登陆
-(IBAction)buttonOnclick:(id)sender
{
    if (![self.renren isSessionValid])
    {
		//PasswordFlowLoginViewController *passwordFlowLoginViewController = [[PasswordFlowLoginViewController alloc] init];
        passwordFlowLoginViewController = [[PasswordFlowLoginViewController alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
		passwordFlowLoginViewController.renren = self.renren;
        passwordFlowLoginViewController.user = self.user;
		[self.navigationController pushViewController:passwordFlowLoginViewController animated:YES];
        passwordFlowLoginViewController.title = @"登陆";
		//[passwordFlowLoginViewController release];
	}
    else
    {
		//ServiceTableViewController *serviceTableViewController = [[ServiceTableViewController alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
		//serviceTableViewController.renren = self.renren;
		//[self.navigationController pushViewController:serviceTableViewController animated:YES];
		//[serviceTableViewController release];
	}
}
//登陆到主页面
-(void)doLoginMainScene:(NSNotification*)sender
{
     mainViewController.user = sender.object;
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    mainViewController = [[TSMainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] init];
    mainViewController.title = @"首页";
    mainViewController.renren = self.renren;
    mainViewController.user = self.user;
    [mainNav pushViewController:mainViewController animated:YES];
    [items addObject:mainNav];
    
    msgViewController = [[TSMsgViewController alloc] init];
    msgViewController.title = @"消息";
    UINavigationController *msgNav = [[UINavigationController alloc] init];
    [msgNav pushViewController:msgViewController animated:YES];
    [items addObject:msgNav];
    
    relationViewController = [[TSRelationViewController alloc] init];
    relationViewController.title = @"关系";
    UINavigationController *relationNav = [[UINavigationController alloc] init];
    [relationNav pushViewController:relationViewController animated:YES];
    [items addObject:relationNav];
    
    meViewController = [[TSMeViewController alloc] init];
    meViewController.title = @"我";
    UINavigationController *meNav = [[UINavigationController alloc] init];
    [meNav pushViewController:meViewController animated:YES];
    [items addObject:meNav];
    
    TSTabBarViewController *tabBar = [[TSTabBarViewController alloc] init];
    [tabBar setTitle:@"TabBarController"];
    [tabBar setViewControllers:items];
    
    [self presentViewController:tabBar animated:YES completion:^(void){[self changeNavigation];}];
}

//导航栏
- (void)changeNavigation
{
    
}

@end
