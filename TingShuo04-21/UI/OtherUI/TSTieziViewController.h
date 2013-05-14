//
//  TSTieziViewController.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-7.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSTieziHeadCell.h"

@interface TSTieziViewController : UITableViewController<TSTieziHeadCellDelegate>

- (void) updateContent:(NSArray *)conArr;

@end
