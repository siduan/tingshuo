//
//  TSScrollTopTenView.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-15.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSScrollTopTenItem;
@class TSScrollTopTenView;

#pragma mark - TSScrollTopTenViewDelegate
@protocol TSScrollTopTenViewDelegate <NSObject>

- (void)foucusCellFrame:(TSScrollTopTenView *)cellFrame didSelectItem:(TSScrollTopTenItem *)item;

@end

@interface TSScrollTopTenView : UIView <UIGestureRecognizerDelegate, UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame delegate:(id<TSScrollTopTenViewDelegate>)delegate focusCellItems:(TSScrollTopTenItem *)items, ... NS_REQUIRES_NIL_TERMINATION;

@property (nonatomic, assign) id<TSScrollTopTenViewDelegate> delegate;

@end

