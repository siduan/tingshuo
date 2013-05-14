//
//  RenrenSDKDemo
//
//  Created by xiawenhai on 11-8-22.
//  Copyright 2011年 Renren Inc. All rights reserved.
//  - Powered by Team Pegasus. -
//
#import "PasswordFlowLoginViewController.h"


@implementation PasswordFlowLoginViewController
@synthesize userName = _userName;
@synthesize password = _password;
@synthesize coverView = _coverView;
@synthesize renren = _renren;
@synthesize indicatorView = _indicatorView;
@synthesize user = _user;



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = @"用户名密码方式";
	
	UIBarButtonItem *rightbarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(loginButtonClick:)];
	self.navigationItem.rightBarButtonItem = rightbarButtonItem;
	[rightbarButtonItem release];
	
	UIBarButtonItem *leftbarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backForward:)];
	self.navigationItem.leftBarButtonItem = leftbarButtonItem;
	[leftbarButtonItem release];
	
    [self.userName setText:@"1195655199@qq.com"];
    [self.password setText:@"198845xq"];
	[self.userName becomeFirstResponder];
	
	self.coverView.hidden = YES;
	[self.indicatorView stopAnimating];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//点击登录按钮
- (IBAction)loginButtonClick:(id)sender
{
	if ([self.userName.text isEqualToString:@""] || [self.password.text isEqualToString:@""]) {
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
														message:@"用户名或密码为空，请重新输入!" 
													   delegate:self 
											  cancelButtonTitle:@"确定" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}
	
	ROPasswordFlowRequestParam *requestparam = [[[ROPasswordFlowRequestParam alloc] init] autorelease];
	
	requestparam.userName = self.userName.text;
	requestparam.passWord = self.password.text;
    requestparam.secretKey = @"12800fd211114df8976cebb5441785da";
    //设定需要授予的权限种类
	requestparam.scope = [NSString stringWithFormat:@"operate_like"];
	
	
	//[self.renren passwordFlowAuthorizationWithParam:requestparam andDelegate:self];
	//self.coverView.hidden = NO;
	//[self.indicatorView startAnimating];
    
	[self initAFRenrenClient];
	
    //[self loginMainScene];
}
//返回按钮点击事件
- (void)backForward:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}
//点击进入主界面
-(void)loginMainScene
{
    //if (_delegate && [_delegate respondsToSelector:@selector(doLoginMainScene)])
   // {
    // 	[_delegate doLoginMainScene];
    //}
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginMainScene" object:_user];
}

-(void)initAFRenrenClient
{
    AFRenrenClient *client = [AFRenrenClient sharedClient];
    client.delegate = self;
    [client postUserAccessToken:self.userName.text forPassword:self.password.text];
}
#pragma mark - AFRenrenClientDelegate methods

-(void)AFRenrenClient:(AFRenrenClient *)client didPostAccessToken:(id)token
{
    NSDictionary *dic = (NSDictionary *)token;
    User *userTmp = [[User alloc] initWithAttributes:dic];
    _user = userTmp;
    _renren.accessToken = _user.access_token;

	[self loginMainScene];
}

-(void)AFRenrenClient:(AFRenrenClient *)client didFailWithError:(NSError *)error
{
  
}

#pragma mark - RenrenDelegate methods

-(void)renrenDidLogin:(Renren *)renren
{
	self.coverView.hidden = YES;
	[self.indicatorView stopAnimating];
	//ServiceTableViewController *viewController = [[ServiceTableViewController alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
	//viewController.renren = self.renren;
    //[self.navigationController pushViewController:viewController animated:YES];
	//[viewController release];
}

- (void)renren:(Renren *)renren loginFailWithError:(ROError*)error;
{
	self.coverView.hidden = YES;
	[self.indicatorView stopAnimating];
	NSString *title = [NSString stringWithFormat:@"Error code:%d", [error code]];
	NSString *description = [NSString stringWithFormat:@"%@", [error.userInfo objectForKey:@"error_msg"]];
	UIAlertView *alertView =[[[UIAlertView alloc] initWithTitle:title message:description delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] autorelease];
	[alertView show];
}

- (void)dealloc {
	self.userName = nil;
	self.password = nil;
	self.renren = nil;
	self.coverView = nil;
	self.indicatorView = nil;
    [super dealloc];
}


@end
