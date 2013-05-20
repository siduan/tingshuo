//
//  TSMsgViewController.m
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSMsgViewController.h"
#import "MsgChat.h"

#import "TSMsgChatCell.h"
#import "TSMsgReplyCell.h"
#import "TSMeViewController.h"
#import "ChatViewController.h"
#import "ReplyViewController.h"

@interface TSMsgViewController ()
- (void)reload:(id)sender;
@end

@implementation TSMsgViewController
{
@private
    //NSDictionary *_msgChat;
	
    __strong UIActivityIndicatorView *_activityIndicatorView;
}
@synthesize msgChatDic;
@synthesize singleMsgChatDic;
@synthesize segmentedController;
@synthesize chatDic = _chatDic;
//加载数据
- (void)reload:(id)sender
{
    [_activityIndicatorView startAnimating];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [MsgChat globalTimelineMsgChatWithBlock:^(NSDictionary *chats, NSError *error)
    {
        if (error)
        {
            //[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
        }
        else
        {
            self.msgChatDic = chats;
            [self.tableView reloadData];
        }
        
        [_activityIndicatorView stopAnimating];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
}

#pragma mark - UIViewController

- (void)loadView
{
    [super loadView];
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicatorView.hidesWhenStopped = YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"消息" image:nil tag:2];
        self.tabBarItem = item;

        _chatDic = [NSMutableDictionary dictionaryWithCapacity:10];
        //ChatViewController *chat = [[ChatViewController alloc] init];
        //[_chatDic setObject:chat forKey:@"0"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	NSArray *array = [NSArray arrayWithObjects:@"聊天",@"回复", nil];  
    segmentedController = [[UISegmentedControl alloc] initWithItems:array];  
    segmentedController.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedController.selectedSegmentIndex = 0;
  
   [segmentedController addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];  
   self.navigationItem.titleView = segmentedController;
    //////////////////////////////////////////////
    //self.title = NSLocalizedString(@"AFNetworking", nil);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activityIndicatorView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload:)];
    
    self.tableView.rowHeight = 70.0f;
    
    [self reload:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _activityIndicatorView = nil;
}
//点击顶部“聊天”“回复”按钮事件处理
-(void)segmentAction:(id)sender  
{  
    switch ([sender selectedSegmentIndex]) 
	{  
        case 0:  
        {  
            //UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了聊天" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
            //[alter show];  
            NSLog(@"你点击了聊天");
            [self selectChatCell];
        }  
        break;  
        case 1:  
        {  
            //UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了回复" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
            //[alter show];  
			NSLog(@"你点击了回复");
            [self selectReplyCell];
        }  
        break;  
          
        default:  
            break;  
    }  
} 
//你点击了聊天
-(void)selectChatCell
{
    [self reload:nil];
}

//你点击了回复
-(void)selectReplyCell
{
    [self reload:nil];
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
     if(!self.msgChatDic)
        return 0;
 
    switch (section) 
	{
        case 0:{
            return 1;
        }
        case 1:{
            //NSArray *upcomingWeather = [self.msgChatDic upcomingWeather];
			NSDictionary *dict = [self.msgChatDic objectForKey:@"data"];
            NSArray *upcomingWeather = [dict objectForKey:@"weather"];
            return [upcomingWeather count];
        }
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //赋值
	switch (indexPath.section)
	{
        case 0:{
            singleMsgChatDic = [[[self.msgChatDic objectForKey:@"data"] objectForKey:@"current_condition"] objectAtIndex:0];
            break;
        }
        case 1:{
            //NSArray *upcomingWeather = [self.msgChatDic upcomingWeather];
			NSDictionary *dict = [self.msgChatDic objectForKey:@"data"];
            NSArray *upcomingWeather = [dict objectForKey:@"weather"];
			
            singleMsgChatDic = [upcomingWeather objectAtIndex:indexPath.row];
        }
        default:
            break;
    }

    static NSString *CellIdentifier = @"chatCell";

    switch (segmentedController.selectedSegmentIndex)
    {
        case 0:
        {
            CellIdentifier = @"chatCell";
            TSMsgChatCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSMsgChatCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [cell updateMsgChatDic:singleMsgChatDic];
            return cell;
        }
            
        default:
        {
            CellIdentifier = @"replyCell";
            TSMsgReplyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSMsgReplyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [cell updateMsgReplyDic:singleMsgChatDic];
            return cell;
        }
            
       
    }
	
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [self.msgChatDic objectForKey:@"data"];
    NSArray *dictMsg = [dict objectForKey:@"weather"];
    
    switch (segmentedController.selectedSegmentIndex) {
        case 0:
            return [TSMsgChatCell heightForCellWithMsgChat:[dictMsg objectAtIndex:indexPath.row]];
            break;
        default:
            return [TSMsgReplyCell heightForCellWithMsgReply:[dictMsg objectAtIndex:indexPath.row]];
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSString *key = [NSString stringWithFormat:@"%d", [indexPath row]];
    
    switch (segmentedController.selectedSegmentIndex) {
        case 0:
        {
            ChatViewController *chat = [[ChatViewController alloc] init];//[_chatDic objectForKey:key];
            
            [chat setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:chat animated:YES];
            chat.title = @"与xx聊天";
            [chat release];
            break;
        }
            
        default:
        {
            ReplyViewController *reply = [[ReplyViewController alloc] init];
            [reply setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:reply animated:YES];
            reply.title = @"回复XX";
            [reply release];
            break;
        }
    }
    
}

@end
