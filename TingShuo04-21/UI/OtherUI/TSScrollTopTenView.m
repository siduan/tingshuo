//
//  TSScrollTopTenView.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-15.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSScrollTopTenView.h"
#import "TSQunTopTenCell.h"
#import "TSScrollTopTenItem.h"
#import <objc/runtime.h>

@interface TSScrollTopTenView () {
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

- (void)setupViews;
- (void)switchFocusCellItems;
@end

static NSString *SG_FOCUS_ITEM_ASS_KEY = @"com.touchmob.sgfocusitems";

static CGFloat SWITCH_FOCUS_PICTURE_INTERVAL = 5.0; //switch interval time

@implementation TSScrollTopTenView
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<TSScrollTopTenViewDelegate>)delegate focusCellItems:(TSScrollTopTenItem *)firstItem, ...
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *imageItems = [NSMutableArray array];
        TSScrollTopTenItem *eachItem;
        va_list argumentList;
        if (firstItem)
        {
            [imageItems addObject: firstItem];
            va_start(argumentList, firstItem);
            while((eachItem = va_arg(argumentList, TSScrollTopTenItem *)))
            {
                [imageItems addObject: eachItem];
            }
            va_end(argumentList);
        }
        
        objc_setAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY, imageItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self setupViews];
        
        [self setDelegate:delegate];
    }
    return self;
}

- (void)dealloc
{
    objc_setAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [_scrollView release];
    [_pageControl release];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - private methods
- (void)setupViews
{
    NSArray *imageItems = objc_getAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY);
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    CGSize size = CGSizeMake(100, 44);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.bounds.size.width *.5 - size.width *.5, self.bounds.size.height - size.height, size.width, size.height)];
    
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    
    /*
     _scrollView.layer.cornerRadius = 10;
     _scrollView.layer.borderWidth = 1 ;
     _scrollView.layer.borderColor = [[UIColor lightGrayColor ] CGColor];
     */
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    _pageControl.numberOfPages = imageItems.count;
    _pageControl.currentPage = 0;
    
    _scrollView.delegate = self;
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tapGestureRecognize];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * imageItems.count, _scrollView.frame.size.height);
    for (int i = 0; i < imageItems.count; i++) {
        TSScrollTopTenItem *item = [imageItems objectAtIndex:i];
        //添加图片展示按钮
        TSQunTopTenCell *cell = [[TSQunTopTenCell alloc] init];
        cell.frame = CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        [cell updateContents:nil];
        cell.tag = i;
        //[cell setBackgroundView:item.image];
        
        [_scrollView addSubview:cell];

    }
    [tapGestureRecognize release];
    
    [self performSelector:@selector(switchFocusCellItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
    //objc_setAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)switchFocusCellItems
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusCellItems) object:nil];
    
    CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
    [self moveToTargetPosition:targetX];
    
    [self performSelector:@selector(switchFocusCellItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
}

- (void)singleTapGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%s", __FUNCTION__);
    NSArray *imageItems = objc_getAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY);
    int page = (int)(_scrollView.contentOffset.x / _scrollView.frame.size.width);
    if (page > -1 && page < imageItems.count) {
        TSScrollTopTenItem *item = [imageItems objectAtIndex:page];
        if ([self.delegate respondsToSelector:@selector(foucusCellFrame:didSelectItem:)]) {
            [self.delegate foucusCellFrame:self didSelectItem:item];
        }
    }
    //objc_setAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)moveToTargetPosition:(CGFloat)targetX
{
    NSLog(@"moveToTargetPosition : %f" , targetX);
    if (targetX >= _scrollView.contentSize.width) {
        targetX = 0.0;
    }
    
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES] ;
    _pageControl.currentPage = (int)(_scrollView.contentOffset.x / _scrollView.frame.size.width);
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
    
}
@end
