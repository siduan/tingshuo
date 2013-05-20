//
//  TSQunViewController.m
//  TingShuo04-21
//  群 表格
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSQunViewController.h"
#import "TSQunTopTenCell.h"
#import "TSQunHeadCell.h"
#import "TSQunContentCell.h"
#import "TSTieziViewController.h"

static CGFloat const kMaxAngle = 0.1;
static CGFloat const kMaxOffset = 20;

@interface TSQunViewController ()

@end

@implementation TSQunViewController

@synthesize cellImgsDic = _cellImgsDic;
@synthesize cellImgsArr = _cellImgsArr;
@synthesize mediaFocusManager = _mediaFocusManager;

static TSQunViewController *_sharedInstance = nil;

//单例模式
+ (TSQunViewController *)sharedInstance
{
    
    @synchronized(self)
    {
        if (_sharedInstance == nil)
        {
            _sharedInstance = [[[self alloc] init] autorelease];
        }
    }
    
    return _sharedInstance;
}
//更新内容
- (void) updateContent:(NSArray *)conArr
{
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"xxx群组";
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
    
    _cellImgsDic = [[NSMutableDictionary alloc] init];
    _cellImgsArr = [NSMutableArray arrayWithCapacity:5];
    
    _mediaFocusManager = [[ASMediaFocusManager alloc] init];
    _mediaFocusManager.delegate = self;
}

- (void)loadView
{
    [super loadView];
    
    //_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //_activityIndicatorView.hidesWhenStopped = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
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
            TSQunHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSQunHeadCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [cell updateContents:nil];
            [_cellImgsDic setValue:cell.imageViewArr forKey:[NSString stringWithFormat:@"%d", indexPath.row]];
            return cell;
            //break;
        }
        case 1:
        {
            CellIdentifier = @"toptenCell";
            UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            
            TSScrollTopTenItem *item1 = [[[TSScrollTopTenItem alloc] initWithTitle:@"title1" image:[UIImage imageNamed:@"banner1"] tag:0] autorelease];
            TSScrollTopTenItem *item2 = [[[TSScrollTopTenItem alloc] initWithTitle:@"title2" image:[UIImage imageNamed:@"banner2"] tag:1] autorelease];
            TSScrollTopTenItem *item3 = [[[TSScrollTopTenItem alloc] initWithTitle:@"title3" image:[UIImage imageNamed:@"banner3"] tag:2] autorelease];
            TSScrollTopTenItem *item4 = [[[TSScrollTopTenItem alloc] initWithTitle:@"title4" image:[UIImage imageNamed:@"banner4"] tag:4] autorelease];
            TSScrollTopTenView *cellFrame = [[TSScrollTopTenView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 110.0)
                                                                            delegate:self
                                                                     focusCellItems:item1, item2, item3, item4, nil];
            [cell addSubview:cellFrame];
            
            [cellFrame release];
            
            return cell;
        }
        default:
        {
            CellIdentifier = @"contentCell";
            TSQunContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[TSQunContentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
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
            return [TSQunHeadCell heightForCell:nil];
            break;
        case 1:
            return [TSQunTopTenCell heightForCell:nil];
            break;
        default:
            return [TSQunContentCell heightForCell:nil];
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
    // Navigation logic may go here. Create and push another view controller.
    
    if (indexPath.section != 0)
    {
        TSTieziViewController *tieziViewController = [[TSTieziViewController alloc] init];
        // ...
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:tieziViewController animated:YES];
        [tieziViewController updateContent:nil];
        [tieziViewController release];

    }
    else
    {
        _cellImgsArr = [_cellImgsDic objectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
        [self.mediaFocusManager installOnViews:_cellImgsArr];
        
        [self addSomeRandomTransformOnThumbnailViews];
    }
    
}

#pragma mark -
- (void)foucusCellFrame:(TSScrollTopTenView *)cellFrame didSelectItem:(TSScrollTopTenItem *)item
{
    NSLog(@"%@ tapped", item.title);
    TSTieziViewController *tieziViewController = [[TSTieziViewController alloc] init];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:tieziViewController animated:YES];
    [tieziViewController updateContent:nil];
    [tieziViewController release];
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
        
        angle = [TSQunViewController randomFloatBetween:-kMaxAngle andMax:kMaxAngle];
        offsetX = (NSInteger)[TSQunViewController randomFloatBetween:-kMaxOffset andMax:kMaxOffset];
        offsetY = (NSInteger)[TSQunViewController randomFloatBetween:-kMaxOffset andMax:kMaxOffset];
        view.transform = CGAffineTransformMakeRotation(angle);
        view.center = CGPointMake(view.center.x + offsetX, view.center.y + offsetY);
        
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
