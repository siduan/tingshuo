//
//  TSScrollTopTenItem.h
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-15.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSScrollTopTenItem : NSObject

@property (nonatomic, retain)  NSString     *title;
@property (nonatomic, retain)  UIImage      *image;
@property (nonatomic, assign)  NSInteger     tag;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag;
@end
