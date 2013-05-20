//
//  TSScrollTopTenItem.m
//  TingShuo04-21
//
//  Created by 张 璐 on 13-5-15.
//  Copyright (c) 2013年 孙云高. All rights reserved.
//

#import "TSScrollTopTenItem.h"

@implementation TSScrollTopTenItem
@synthesize title =  _title;
@synthesize image =  _image;
@synthesize tag =  _tag;

- (void)dealloc
{
    [_title release];
    [_image release];
    [super dealloc];
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
{
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.tag = tag;
    }
    
    return self;
}

@end
