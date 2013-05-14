//
//  TSReleaseViewController.h
//  zjtSinaWeiboClient
//
//  Created by Zhu Jianting on 12-3-14.
//  Copyright (c) 2012年 WS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TSReleaseViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    BOOL _shouldPostImage;
}
@property (retain, nonatomic) IBOutlet UIScrollView *theScrollView;
@property (retain, nonatomic) IBOutlet UIImageView *theImageView;
@property (retain, nonatomic) IBOutlet UIImageView *TVBackView;

@property (retain, nonatomic) IBOutlet UITextView *theTextView;
@end
