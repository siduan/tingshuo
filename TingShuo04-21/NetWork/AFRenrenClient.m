// AFRenrenClient.h
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

#import "AFRenrenClient.h"

#import "AFJSONRequestOperation.h"

static NSString * const AFRenrenBaseURLString = @"https://graph.renren.com/";

@implementation AFRenrenClient
//create an instance
+ (AFRenrenClient *)sharedClient 
{
    static AFRenrenClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:AFRenrenBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url 
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];

	[self setDefaultHeader:@"Accept" value:@"application/json"];
    //[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    return self;
}

- (void)postUserAccessToken:(NSString *)userName forPassword:(NSString *)password
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
	[parameters setObject:@"password" forKey:@"grant_type"];
	[parameters setObject:userName forKey:@"username"];
	[parameters setObject:password forKey:@"password"];
	[parameters setObject:@"7940042e6504418a9e53a57c615bf6c2" forKey:@"client_id"];//API Key
	[parameters setObject:@"e1b5b789a99142f3923843948209ad4c" forKey:@"client_secret"];//Secret Key
	[parameters setObject:@"read_user_feed publish_feed" forKey:@"scope"];
	
	[self postPath:@"oauth/token"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              
              
              if([self.delegate respondsToSelector:@selector(AFRenrenClient:didPostAccessToken:)])
              {
                  [self.delegate AFRenrenClient:self didPostAccessToken:responseObject];
              }
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            if([self.delegate respondsToSelector:@selector(AFRenrenClient:didFailWithError:)])
            {
                [self.delegate AFRenrenClient:self didFailWithError:error];
            }
        }];
}
 
@end
