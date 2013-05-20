//
//  TSQunViewController.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSScrollTopTenView.h"
#import "TSScrollTopTenItem.h"
#import "ASMediaFocusManager.h"

@interface TSQunViewController : UITableViewController <TSScrollTopTenViewDelegate,ASMediasFocusDelegate>

//+ (TSQunViewController *)sharedInstance;

- (void) updateContent:(NSArray *)conArr;

@property (strong, nonatomic) ASMediaFocusManager *mediaFocusManager;

@property (strong, nonatomic) NSMutableDictionary *cellImgsDic;//存放所有cell中可点击放大至全屏的图片
@property (strong, nonatomic) NSMutableArray *cellImgsArr;//存放某个cell中可点击放大至全屏的图片

@end
