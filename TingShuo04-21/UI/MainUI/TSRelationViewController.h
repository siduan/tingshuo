//
//  TSRelationViewController.h
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//http://blog.csdn.net/totogo2010/article/details/7645693

#import <UIKit/UIKit.h>
#import "TSRelationQunCell.h"
#import "TSRelationAttentionCell.h"
#import "TSRelationFensiCell.h"
#import "ChatViewController.h"
#import "TSQunViewController.h"

@interface TSRelationViewController : UITableViewController<TSRelationQunCellDelegate, TSRelationFensiCellDelegate, TSRelationAttentionCellDelegate, TSPersonIntroDelegate, UIAlertViewDelegate>
{
    int curSelected;//选择了哪一个二级导航
}
@property (nonatomic, assign) int curSelected;
@property (strong, nonatomic) NSArray *qunArr;//群组的列表 plist获取
@property (strong, nonatomic) NSArray *attentionFriArr;//关注好友的列表 plist获取
@property (strong, nonatomic) NSArray *fensiFriArr;//粉丝好友的列表 plist获取

@property (strong, nonatomic) NSIndexPath *nowIndexPath;

@property (strong, nonatomic) ChatViewController *tsFensiChatViewController;
@property (strong, nonatomic) ChatViewController *tsAttentionChatViewController;
@property (strong, nonatomic) TSQunViewController *tsQunViewController;

@property (nonatomic, strong) TSPersonIntroUIView *tsPersonIntroUIView;
@end
