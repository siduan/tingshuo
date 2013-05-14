//
//  MsgChat.m
//  TingShuo4-9
//
//  Created by ’≈ Ë¥ on 13-4-14.
//  Copyright (c) 2013ƒÍ ÀÔ‘∆∏ﬂ. All rights reserved.
//

#import "MsgChat.h"

#import "AFServerHTTPClient.h"

//JSON
NSString *const BaseURLString = @"http://www.raywenderlich.com/downloads/weather_sample/";
//NSString *const BaseURLString = @"http://ums.tingshuoapp.com/";

@implementation MsgChat
@synthesize chatID = _chatID;
@synthesize imageURL = _imageURL;
@synthesize name = _name;
@synthesize sex = _sex;
@synthesize time = _time;
@synthesize content = _content;


//初始化属性
- (id)initWithAttributes:(NSDictionary *)attributes 
{
    self = [super init];
    if (!self) 
	{
        return nil;
    }
    
    _chatID = [[attributes valueForKeyPath:@"id"] integerValue];
    _imageURL = [attributes valueForKeyPath:@"imageURL"];
	_name = [attributes valueForKeyPath:@"name"];
	_sex = [attributes valueForKeyPath:@"sex"];
	_time = [attributes valueForKeyPath:@"time"];
	_content = [attributes valueForKeyPath:@"content"];
    
    return self;
}
//从服务器请求数据this request many msgchat prop
#pragma mark -

+ (void)globalTimelineMsgChatWithBlock:(void (^)(NSDictionary *chats, NSError *error))block 
{
    // 1NSURLRequest.
    NSString *weatherUrl = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
    //NSString *weatherUrl = [NSString stringWithFormat:@"%@posts", BaseURLString];
    NSURL *url = [NSURL URLWithString:weatherUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 
    // 2
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
        // 3
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            //self.weather  = (NSDictionary *)JSON;
            //self.title = @"JSON Retrieved";
            //[self.tableView reloadData];
			NSDictionary *dic = (NSDictionary *)JSON;
            //NSDictionary *dict = [dic objectForKey:@"data"];
            //NSArray *upcomingWeather = [dict objectForKey:@"current_condition"];
            //NSString *str = [[upcomingWeather objectAtIndex:0] objectForKey:@"pressure"];
            //NSLog(str);
			if (block) 
			{
				block(dic, nil);
            }
        }
        // 4
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"msgchat error"
                                                         message:[NSString stringWithFormat:@"%@",error]
                                                        delegate:nil
                                               cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [av show];
			//if (block) 
			//{
			//	block([NSDictionary dict], error);
			//}
        }];
 
    // 5
    [operation start];
}

@end