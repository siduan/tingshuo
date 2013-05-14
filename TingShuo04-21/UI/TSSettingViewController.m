//
//  TSSettingViewController.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-2.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSSettingViewController.h"
#import "AboutViewController.h"

//sections
enum{
    kStatusSection = 0,
    kAccountSection,
    kSectionsCount,
};

//rows

//status
enum{
    kStatusBlackList = 0,
    kStatusSetTheme,
    kStatusMoreReffer,
    kStatusRowsCount,
};

//kAccountSection
enum {
    kCurrentUser = 0,
    kClearCatch,
    kFeedback,
    kSupport,
    kAccountRowsCount,
};

@interface TSSettingViewController ()

@end

@implementation TSSettingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"设置";
        
        self = [super initWithStyle:UITableViewStyleGrouped];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == kStatusSection) {
        return kStatusRowsCount;
    }
    else if (section == kAccountSection) {
        return kAccountRowsCount;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//右边带">"形状的
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // Configure the cell...
    
    if (section == kAccountSection)
    {
        if (row == kCurrentUser) {
            NSString *name = @"景言";
            cell.textLabel.text = [NSString stringWithFormat:@"当前登陆账号：%@",name];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else if (row == kClearCatch) {
            cell.textLabel.text = @"清理缓存";
        }
        else if (row == kFeedback){
            cell.textLabel.text = @"反馈意见";
        }
        else if (row == kSupport) {
            cell.textLabel.text = @"支持我们";
        }
    }
    
    else if (section == kStatusSection) {
        if (row == kStatusBlackList) {
            cell.textLabel.text = @"黑名单列表";
        }
        
        else if (row == kStatusSetTheme) {
            cell.textLabel.text = @"设置主题";
        }
        else if (row == kStatusMoreReffer){
            cell.textLabel.text = @"更多推荐";
        }
    }
    return cell;
}
//退出登录
-(void)logout
{
   //OAuthWebView *webV = [[OAuthWebView alloc]initWithNibName:@"OAuthWebView" bundle:nil];
    //webV.hidesBottomBarWhenPushed = YES;
    //[self.navigationController pushViewController:webV animated:YES];
    //[webV release];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    if (section == kAccountSection ) {
        if (row == kCurrentUser) {
            
        }
        
        else if (row == kClearCatch) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"确定要清理一天前的缓存吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更换", nil];
            [alert show];
            [alert release];
        }
        
        else if (row == kSupport) {
            AboutViewController *a = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
            a.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:a animated:YES];
            [a release];
        }
    }
    
    else if (section == kStatusSection) {
        if (row == kStatusBlackList) {
            
        }
        
        else if (row == kStatusSetTheme) {
            
        }
        
        else if (row == kStatusMoreReffer) {
            
        }
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self logout];
    }
}

@end
