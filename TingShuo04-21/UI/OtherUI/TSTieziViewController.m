//
//  TSTieziViewController.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSTieziViewController.h"
#import "TSTieziHeadCell.h"
#import "TSTieziContentCell.h"

static CGFloat const kMaxAngle = 0.1;
static CGFloat const kMaxOffset = 20;

@interface TSTieziViewController ()

@end

@implementation TSTieziViewController
@synthesize cellImgsDic = _cellImgsDic;
@synthesize cellImgsArr = _cellImgsArr;
@synthesize mediaFocusManager = _mediaFocusManager;
@synthesize releaseViewController = _releaseViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"来自xxxx群组";
        
        UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStylePlain target:self action:@selector(releaseRightBtn:)];
        self.navigationItem.rightBarButtonItem = releaseButtonItem;
        [releaseButtonItem release];
    }
    return self;
}

//评论按钮
- (void)releaseRightBtn:(id)sender
{
    _releaseViewController = [[TSReleaseViewController alloc] init];
    [self.navigationController pushViewController:_releaseViewController animated:YES];
    _releaseViewController.title = @"评论";
    
}

//更新内容
- (void) updateContent:(NSArray *)conArr
{
    
}

- (void)loadView
{
    [super loadView];
    
    //_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //_activityIndicatorView.hidesWhenStopped = YES;
}
//代理方法 
-(void)switchNeworHot:(BOOL)isNew
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _cellImgsDic = [[NSMutableDictionary alloc] init];
    _cellImgsArr = [NSMutableArray arrayWithCapacity:5];
    
    _mediaFocusManager = [[ASMediaFocusManager alloc] init];
    _mediaFocusManager.delegate = self;
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
            return 12;//假设为12,数量为发送的状态数目
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    switch (indexPath.section) {
        case 0:
        {
            CellIdentifier = @"headCell";
            TSTieziHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSTieziHeadCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
                cell.delegate = self;
            }
            [cell updateContents:nil];
            [_cellImgsDic setValue:cell.imageViewArr forKey:[NSString stringWithFormat:@"%d", indexPath.row]];
            _cellImgsArr = [_cellImgsDic objectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
            [self.mediaFocusManager installOnViews:_cellImgsArr];
            
            [self addSomeRandomTransformOnThumbnailViews];
            return cell;
            //break;
        }
        default:
        {
            CellIdentifier = @"contentCell";
            TSTieziContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSTieziContentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
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
    
    switch (indexPath.section)
    {
        case 0:
            return [TSTieziHeadCell heightForCell:nil];
            break;
        default:
            return [TSTieziContentCell heightForCell:nil];
            break;
    }
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
    }
    else{
        
    }
}

///////////////////以下是点击小图片方大全屏的代码
+ (float)randomFloatBetween:(float)smallNumber andMax:(float)bigNumber
{
    float diff = bigNumber - smallNumber;
    
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

- (void)addSomeRandomTransformOnThumbnailViews
{
    for(UIView *view in _cellImgsArr)
    {
        CGFloat angle;
        NSInteger offsetX;
        NSInteger offsetY;
        
        angle = [TSTieziViewController randomFloatBetween:-kMaxAngle andMax:kMaxAngle];
        offsetX = (NSInteger)[TSTieziViewController randomFloatBetween:-kMaxOffset andMax:kMaxOffset];
        offsetY = (NSInteger)[TSTieziViewController randomFloatBetween:-kMaxOffset andMax:kMaxOffset];
        //view.transform = CGAffineTransformMakeRotation(angle);//旋转图片
        //view.center = CGPointMake(view.center.x + offsetX, view.center.y + offsetY);//图片的中心点变了
        
        // This is going to avoid crispy edges.
        view.layer.shouldRasterize = YES;
        view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
}
#pragma mark - ASMediaFocusDelegate
- (UIImage *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager imageForView:(UIView *)view
{
    return ((UIImageView *)view).image;
}

- (CGRect)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager finalFrameforView:(UIView *)view
{
    return self.parentViewController.view.bounds;
}

- (UIViewController *)parentViewControllerForMediaFocusManager:(ASMediaFocusManager *)mediaFocusManager
{
    return self.parentViewController;
}
//要放大的那张图片，就是放出去的
- (NSString *)mediaFocusManager:(ASMediaFocusManager *)mediaFocusManager mediaPathForView:(UIView *)view
{
    NSString *path;
    NSString *name;
    
    // Here, images are accessed through their name "1f.jpg", "2f.jpg", …
    //name = [NSString stringWithFormat:@"%df", ([_cellImgsArr indexOfObject:view] + 1)];
    name = @"Icon";
    path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    
    return path;
}

@end
