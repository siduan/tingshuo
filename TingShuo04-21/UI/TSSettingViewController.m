//
//  TSSettingViewController.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-2.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSSettingViewController.h"
#import "AboutViewController.h"
#import "PasswordFlowLoginViewController.h"

//sections
enum{
    kStatusSection = 0,
    kAccountSection,
    kSectionsCount,
};

//rows

//status
enum{
    kStatusMyRes = 0,
    kStatusBlackList,
    kStatusRowsCount,
};

//kAccountSection
enum {
    kFeedback = 0,
    kSupport,
    kUserProvision,
    kSecretSetting,
    kLogout,
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
        if (row == kFeedback){
            cell.textLabel.text = @"反馈意见";
        }
        else if (row == kSupport) {
            cell.textLabel.text = @"支持我们,来一票！";
        }
        else if (row == kUserProvision) {
            cell.textLabel.text = @"用户条款";
        }
        else if (row == kSecretSetting) {
            cell.textLabel.text = @"隐私设置";
        }
        else if (row == kLogout) {
            cell.textLabel.text = @"退出";
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    else if (section == kStatusSection) {
        if (row == kStatusMyRes) {
            cell.textLabel.text = @"我的资料";
        }
        else if (row == kStatusBlackList) {
            cell.textLabel.text = @"黑名单";
        }
    }
    return cell;
}
//退出登录
-(void)logout
{
   PasswordFlowLoginViewController *loginView = [[[PasswordFlowLoginViewController alloc]init]   autorelease];
    loginView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginView animated:YES];
    [loginView release];
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
    
    if (section == kStatusSection ) {
        if (row == kStatusMyRes) {
            
        }
        
        else if (row == kStatusBlackList) {
        
        }
    }
    
    else if (section == kAccountSection) {
        if (row == kFeedback) {
            
        }
        
        else if (row == kSupport) {
            AboutViewController *a = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
            a.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:a animated:YES];
            [a release];
        }
        
        else if (row == kUserProvision) {
            
        }
        else if (row == kSecretSetting) {
            
        }
        else if (row == kLogout) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"确定要退出吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
            [alert show];
            [alert release];
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
