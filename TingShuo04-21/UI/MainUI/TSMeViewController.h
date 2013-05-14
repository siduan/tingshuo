//
//  TSMeViewController.h
//  TingShuo4-9
//
//  Created by 张 璐 on 13-4-14.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSSettingViewController.h"

@interface TSMeViewController : UITableViewController{
    
    
    
}

@property (strong, nonatomic) TSSettingViewController *tsSettingViewController;

- (void) updateContent:(NSArray *)conArr;

@end
