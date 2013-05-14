//
//  TSMsgViewController.h
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSMsgViewController : UITableViewController

@property (strong, nonatomic) NSDictionary *msgChatDic;
@property (strong, nonatomic) NSDictionary *singleMsgChatDic;

@property (strong, nonatomic) UISegmentedControl *segmentedController;

@end
