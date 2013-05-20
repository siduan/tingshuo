//
//  TSMainViewController.m
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMainViewController.h"
#import "Post.h"

#import "TSMainFriCell.h"
#import "TSMainFriQunCell.h"
#import "TSMainQunCell.h"

#import "TSQunViewController.h"
#import "TSInputToolbar.h"



@interface TSMainViewController ()
- (void)reload:(id)sender;
@end

@interface TSMainViewController ()

@end

@implementation TSMainViewController
{
@private
    //__strong UIActivityIndicatorView *_activityIndicatorView;//菊花转
}
@synthesize mainArr;
@synthesize singleMsgChatDic;

@synthesize releaseViewController = _releaseViewController;

@synthesize renren = _renren;
@synthesize user = _user;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:1];
        self.tabBarItem = item;
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",9];
        
        UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(releaseRightBtn:)];
        self.navigationItem.rightBarButtonItem = releaseButtonItem;
        [releaseButtonItem release];
        
    }
    return self;
}

//加载数据
- (void)reload:(id)sender
{
    //[_activityIndicatorView startAnimating];
    self.navigationItem.rightBarButtonItem.enabled = NO;

    ROUserInfoRequestParam *requestParam = [[[ROUserInfoRequestParam alloc] init] autorelease];
    requestParam.userIDs = @"522601598";
	requestParam.fields = @"uid,name,sex,headurl";
	
	[self.renren getUsersInfo:requestParam andDelegate:self];
}
//下拉刷新,覆盖父类的方法
- (void)refresh
{
    [self performSelector:@selector(reload:) withObject:nil afterDelay:2.0];
}
/**
 * 接口请求成功，第三方开发者实现这个方法
 */
- (void)renren:(Renren *)renren requestDidReturnResponse:(ROResponse*)response
{
	NSArray *usersInfo = (NSArray *)(response.rootObject);
	
     self.mainArr = [[NSMutableArray alloc] init];
	for (ROUserResponseItem *item in usersInfo)
    {
        for (int i=0; i<9; i++) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:item.userId forKey:@"userId"];
            [dic setValue:item.name forKey:@"name"];
            [dic setValue:item.sex forKey:@"sex"];
            //[dic setValue:item.brithday forKey:@"birthday"];
            [dic setValue:item.headUrl forKey:@"headUrl"];
            
            [self.mainArr addObject:dic];
            [dic release];
        }
        
	}
    
	[self.tableView reloadData];
    [self stopLoading];
    
    //[_activityIndicatorView stopAnimating];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

/**
 * 接口请求失败，第三方开发者实现这个方法
 */
- (void)renren:(Renren *)renren requestFailWithError:(ROError*)error
{
	NSString *title = [NSString stringWithFormat:@"Error code:%d", [error code]];
	NSString *description = [NSString stringWithFormat:@"%@", [error.userInfo objectForKey:@"error_msg"]];
	UIAlertView *alertView =[[[UIAlertView alloc] initWithTitle:title message:description delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] autorelease];
	[alertView show];
}

- (void)loadView
{
    [super loadView];
    
    //_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //_activityIndicatorView.hidesWhenStopped = YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activityIndicatorView];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload:)];
    
    
    self.tableView.rowHeight = 70.0f;
    
    [self reload:nil];
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    //_activityIndicatorView = nil;
}

//发布按钮
- (void)releaseRightBtn:(id)sender
{
    _releaseViewController = [[TSReleaseViewController alloc] init];
    [self.navigationController pushViewController:_releaseViewController animated:YES];
    _releaseViewController.title = @"发布";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(!self.mainArr)
        return 0;
    
    return [self.mainArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
			
    singleMsgChatDic = [self.mainArr objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"fricell";
    
    switch (indexPath.row)//以后改成别的条件，根据数据类型判断
    {
        case 0:
        {
            CellIdentifier = @"fricell";
            TSMainFriCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell)
            {
                cell = [[TSMainFriCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
                [cell updateMsgReplyDic:singleMsgChatDic];
            }
            cell.delegate = self;
            return cell;
        }
            
        case 1:
        {
            CellIdentifier = @"friQuncell";
            TSMainFriQunCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell)
            {
                cell = [[TSMainFriQunCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
                [cell updateMsgReplyDic:singleMsgChatDic];
            }
            return cell;
        }
        default:
        {
            CellIdentifier = @"quncell";
            TSMainQunCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell)
            {
                cell = [[TSMainQunCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
                [cell updateMsgReplyDic:singleMsgChatDic];
            }
            
            return cell;
        }
            
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    singleMsgChatDic = [self.mainArr objectAtIndex:indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            return [TSMainFriCell heightForCellWithMsgReply:[self.mainArr objectAtIndex:indexPath.row]];
            break;
        case 1:
            return [TSMainFriQunCell heightForCellWithMsgReply:[self.mainArr objectAtIndex:indexPath.row]];
            break;
        default:
            return [TSMainQunCell heightForCellWithMsgReply:[self.mainArr objectAtIndex:indexPath.row]];
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0://朋友
        {
            
            break;
        }
        case 1://朋友所在的群
        {
            TSQunViewController *tsQunViewController = [[TSQunViewController alloc] init];
            [self.navigationController pushViewController:tsQunViewController animated:YES];
            [tsQunViewController updateContent:nil];
            [tsQunViewController release];
            break;
        }
        default://关注的群
        {
            TSQunViewController *tsQunViewController = [[TSQunViewController alloc] init];
            [self.navigationController pushViewController:tsQunViewController animated:YES];
            [tsQunViewController updateContent:nil];
            [tsQunViewController release];
            break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击回复，弹出回复输入框和键盘  代理mainfricell方法
-(void)replyHandler:(NSString *)nameStr
{
    //创建toolbar
    TSInputToolbar *tsToolBar = [[[TSInputToolbar alloc] initWithFrame:CGRectMake(0.0f, 20.0f, 320.0f, 40.0f) ] autorelease];
    [self.tableView addSubview:tsToolBar];
}

@end
