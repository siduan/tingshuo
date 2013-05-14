// Post.m
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "Post.h"
#import "User.h"

#import "AFServerHTTPClient.h"

@implementation Post
@synthesize postID = _postID;
@synthesize text = _text;
@synthesize user = _user;

//接收到服务器数据后，初始化
- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _postID = [[attributes valueForKeyPath:@"id"] integerValue];
    _text = [attributes valueForKeyPath:@"text"];
    
    _user = [[User alloc] initWithAttributes:[attributes valueForKeyPath:@"user"]];
    
    return self;
}

#pragma mark -

+ (void)globalTimelinePostsWithBlock:(void (^)(NSDictionary *posts, NSError *error))block
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
	[parameters setObject:@"password" forKey:@"grant_type"];
	[parameters setObject:@"haha" forKey:@"username"];
	[parameters setObject:@"tingshuo" forKey:@"password"];
	[parameters setObject:@"02e8aa6cf2c94e2e81c40aa4065999a3" forKey:@"client_id"];//API Key
	[parameters setObject:@"12800fd211114df8976cebb5441785da" forKey:@"client_secret"];//Secret Key
	[parameters setObject:@"read_user_feed publish_feed" forKey:@"scope"];
    
    [[AFServerHTTPClient sharedClient] getPath:@"posts"
                                     parameters:nil
                                        success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSDictionary *dic = (NSDictionary *)JSON;
        
        if (block)
        {
            block(dic, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if (block)
        {
            block([NSArray array], error);
        }
    }];
    //[operation start];
}

@end
