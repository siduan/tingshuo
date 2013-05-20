//
//  TSRelationViewController.m
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSRelationViewController.h"
#import "ChatViewController.h"
#import "TSRelationAttentionCell.h"
#import "TSRelationQunCell.h"
#import "TSRelationFensiCell.h"
#import "TSQunViewController.h"


@interface TSRelationViewController ()

@end

@implementation TSRelationViewController

@synthesize curSelected;
@synthesize attentionFriArr = _attentionFriArr;
@synthesize qunArr = _qunArr;
@synthesize fensiFriArr = _fensiFriArr;

@synthesize nowIndexPath = _nowIndexPath;

@synthesize tsFensiChatViewController = _tsFensiChatViewController;
@synthesize tsAttentionChatViewController = _tsAttentionChatViewController;
@synthesize tsQunViewController = _tsQunViewController;

@synthesize tsPersonIntroUIView = _tsPersonIntroUIView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"身边" image:nil tag:3];
        self.tabBarItem = item;
        
        _tsFensiChatViewController = [[ChatViewController alloc] init];
        _tsAttentionChatViewController = [[ChatViewController alloc] init];
 
        _tsQunViewController = [[TSQunViewController alloc] init];
        
        _tsPersonIntroUIView = [[TSPersonIntroUIView alloc] initWithFrame:CGRectMake(20.0f, 30.0f, 280.0f, 330.0f)];
    }
    return self;
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
	NSArray *array = [NSArray arrayWithObjects:@"群组",@"关注",@"粉丝", nil];  
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems:array];  
    segmentedController.segmentedControlStyle = UISegmentedControlSegmentCenter;
    segmentedController.selectedSegmentIndex = 0;
  
   [segmentedController addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];  
   self.navigationItem.titleView = segmentedController;  
   
   // [self initBtn];
	
	//获取plist
	NSBundle *bundle = [NSBundle mainBundle];  
    NSString *plistPath = [bundle pathForResource:@"attentionFriend" ofType:@"plist"];  
    NSMutableArray *arr=[[NSMutableArray  alloc] initWithContentsOfFile:plistPath];  
    self.attentionFriArr = arr;
    self.fensiFriArr = arr;
}

//点击顶部@"群组",@"关注",@“粉丝”按钮事件处理
-(void)segmentAction:(id)sender  
{
    [_tsPersonIntroUIView doCloseSelected];
    switch ([sender selectedSegmentIndex]) 
	{  
        case 0:  
        {  
            //UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了群组" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
            //[alter show];  
			curSelected = 0;
        }  
        break;  
    case 1:  
        {  
            //UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了关注" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
            //[alter show];  
			curSelected = 1;
        }  
        break;  
	case 2:  
        {  
            //UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了粉丝" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];  
            //[alter show];  
			curSelected = 2;
        }  
        break;
          
        default:  
            break;  
    }
    [self.tableView reloadData];
} 

-(void)initBtn
{
    CGRect frame = CGRectMake(90, 200, 200, 60);
    UIButton *someAddButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    someAddButton.backgroundColor = [UIColor clearColor];
    [someAddButton setTitle:@"动态添加一个按钮!" forState:UIControlStateNormal];
    someAddButton.frame = frame;
    [someAddButton addTarget:self action:@selector(doSelected) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:someAddButton];
}

-(void)doSelected
{
    //TSChatViewController *tsChatViewController = [[TSChatViewController alloc] init];
    //[self.navigationController pushViewController:tsChatViewController animated:YES];
    //tsChatViewController.title = @"与xx聊天";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//打开关注 代理函数
-(void)openAttention:(NSString *)qunId
{
    //[_tsAttentionChatViewController setHidesBottomBarWhenPushed:YES];
    //[self.navigationController pushViewController:_tsAttentionChatViewController animated:YES];
    _tsAttentionChatViewController.title = @"与xx聊天";
    [_tsAttentionChatViewController release];
}
//关注 点击图片显示个人简介 代理函数
-(void)imageViewClick:(NSString *)qunId
{
    [_tsPersonIntroUIView updateContents:nil];
    [self.tableView addSubview:_tsPersonIntroUIView];
    [_tsPersonIntroUIView showAnimation];
}
//个人简介 点击 修改资料按钮 代理函数
-(void)changeInfoCallBack:(NSString *)qunId
{
    
}
//打开粉丝 代理函数
- (void) openFensi:(NSString *)qunId
{
    [_tsFensiChatViewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_tsFensiChatViewController animated:YES];
    _tsFensiChatViewController.title = @"与xx聊天";
    [_tsFensiChatViewController release];
}
//粉丝 点击头像显示个人简介按钮 代理函数
-(void)imageViewFensiClick:(NSString *)qunId
{
    [_tsPersonIntroUIView updateContents:nil];
    [self.tableView addSubview:_tsPersonIntroUIView];
    [_tsPersonIntroUIView showAnimation];
}
//预留点击 群组的代理函数
- (void) openSomething:(NSString *)qunId
{
    
}

/////////////////////////////////////////////////
//表格有几个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (curSelected) {
        case 0:
            return 1;
            break;
        case 1:
            return [_attentionFriArr count];
            break;
        default:
            return [_fensiFriArr count];
            break;
    }
}
//表格第section个分段有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (curSelected) {
        case 0:
            return 15;
            //return [_qunArr count];
            break;
        case 1:
        {
            
            NSArray *friends = [[_attentionFriArr objectAtIndex:section]objectForKey:@"friends"];
            return [friends count];
            break;
        }
        default:
        {
            NSArray *friends = [[_fensiFriArr objectAtIndex:section]objectForKey:@"friends"];
            return [friends count];
            break;
        }
    }
} 
//某个分组的某一行是什么数据，返回一个UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{  
    NSUInteger section = [indexPath section];   
    NSUInteger row = [indexPath row];   
    
    switch (curSelected) {
        case 0:
        {
            static NSString *GroupedTableIdentifier = @"qunCell";
            TSRelationQunCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                             GroupedTableIdentifier];
            if (cell == nil)
            {
                cell = [[TSRelationQunCell alloc]
                        initWithStyle:UITableViewCellStyleSubtitle
                        reuseIdentifier:GroupedTableIdentifier];
                cell.delegate = self;
            }
            [cell updateContents:nil];
            return cell;
        }
        case 1:
        {
            NSArray *friends = [[_attentionFriArr objectAtIndex:section]objectForKey:@"friends"] ;
            static NSString *GroupedTableIdentifier = @"attentionCell";
            TSRelationAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                             GroupedTableIdentifier];
            if (cell == nil)
            {
                cell = [[TSRelationAttentionCell alloc]
                        initWithStyle:UITableViewCellStyleSubtitle
                        reuseIdentifier:GroupedTableIdentifier];
                 cell.delegate = self;
            }
            [cell updateContents:nil];
            //给Label附上朋友名称  key 为：name
            cell.textLabel.text = [[friends objectAtIndex:row] objectForKey:@"name"];
            return cell;
        }
        default:
        {
            NSArray *friends = [[_fensiFriArr objectAtIndex:section]objectForKey:@"friends"] ;
            static NSString *GroupedTableIdentifier = @"fensiCell";
            TSRelationFensiCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                             GroupedTableIdentifier];
            if (cell == nil)
            {
                cell = [[TSRelationFensiCell alloc]
                        initWithStyle:UITableViewCellStyleSubtitle
                        reuseIdentifier:GroupedTableIdentifier];
                 cell.delegate = self;
            }
            [cell updateContents:nil];
            //给Label附上朋友名称  key 为：name
            cell.textLabel.text = [[friends objectAtIndex:row] objectForKey:@"name"];
            return cell;
        }
    }
} 
//表格第section分组的名称 
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    NSString *characterName =@"";
    switch (curSelected) {
        case 0:
            break;
        case 1:
            characterName = [[_attentionFriArr objectAtIndex:section] objectForKey:@"character"];
            break;
        default:
            characterName = [[_fensiFriArr objectAtIndex:section] objectForKey:@"character"];
            break;
    }
    
    return characterName;   
}  
//返回所有省份名称的数组 ，通过点击右边的省份名称能快速定位到这个省份的城市，也就是快速定位到这个section。
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    switch (curSelected) {
        case 0:
        {
            return nil;
        }
        case 1:
        {
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:[_attentionFriArr count]];
            for (NSDictionary *dict in _attentionFriArr)
            {
                [array addObject:[dict objectForKey:@"character"]];
            }  
            return array;
            //break;
        }
        default:
        {
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:[_fensiFriArr count]];
            for (NSDictionary *dict in _fensiFriArr)
            {
                [array addObject:[dict objectForKey:@"character"]];
            }
            return array;
            break;
        }
    }
    //返回省份的数组  
      
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (curSelected) {
        case 0:
            return [TSRelationQunCell heightForCell:nil];
            //break;
        case 1:
            return [TSRelationAttentionCell heightForCell:nil];
            //break;
        default:
            return [TSRelationFensiCell heightForCell:nil];
            //break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (curSelected) {
        case 0:
        {
            
            [self.navigationController pushViewController:_tsQunViewController animated:YES];
            [_tsQunViewController updateContent:nil];
            [_tsQunViewController release];
            break;
        }
        case 1:
            
            break;
        default:
            
            break;
    }
}
//向右滑动删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"确定取消关注该组吗？" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
        switch (curSelected)
        {
            case 0:
                alert.message = @"确定取消关注该组吗？";
                break;
            case 1:
                alert.message = @"确定取消关注该用户吗？";
                break;
            default:
                alert.message = @"确定取消关注该粉丝吗？";
                break;
        }
        
        [alert show];
        [alert release];
        
        //NSLog(@"%d", indexPath.row);
        
        _nowIndexPath = indexPath;
        
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        //[self.myArray removeObjectAtIndex:[indexPath row]];//先把词典中的数组删除掉
        //[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:_nowIndexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
}
@end
