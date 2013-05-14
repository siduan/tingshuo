//
//  TSMeViewController.m
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMeViewController.h"
#import "TSMeTopCell.h"
#import "TSMeContentCell.h"

@interface TSMeViewController ()

@end

@implementation TSMeViewController

//@synthesize themeUIView = _themeUIView;
@synthesize tsSettingViewController = _tsSettingViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"我" image:nil tag:4];
        self.tabBarItem = item;

		UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnAction:)];
        self.navigationItem.rightBarButtonItem = releaseButtonItem;
        [releaseButtonItem release];
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    //_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //_activityIndicatorView.hidesWhenStopped = YES;
}

- (void) updateContent:(NSArray *)conArr
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}


//设置按钮
- (void)settingBtnAction:(id)sender
{
    _tsSettingViewController = [[TSSettingViewController alloc] init];
    [self.navigationController pushViewController:_tsSettingViewController animated:YES];
    _tsSettingViewController.title = @"设置";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return 2;//假设为2,数量为发送的状态数目
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    switch (indexPath.section) {
        case 0:
        {
            CellIdentifier = @"topCell";
            TSMeTopCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSMeTopCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [cell updateContents:nil];
            return cell;
            //break;
        }
            
        default:
        {
            CellIdentifier = @"contentCell";
            TSMeContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSMeContentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [cell updateContents:nil];
            return cell;
            //break;
        }
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
            return [TSMeTopCell heightForCell:nil];
            break;
        default:
            return [TSMeContentCell heightForCell:nil];
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
