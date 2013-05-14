//
//  TSTabBarViewController.m
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSTabBarViewController.h"

@interface TSTabBarViewController ()

@end

@implementation TSTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//监听点击的是那个item
- (void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 1)
    {
        NSLog(@"item 1");
    }
    if (item.tag == 2)
    {
        NSLog(@"item 2");
    }
    if (item.tag == 3)
    {
        NSLog(@"item 3");
    }
    if (item.tag == 4)
    {
        NSLog(@"item 4");
    }
}

@end
