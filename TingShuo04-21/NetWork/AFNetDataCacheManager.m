//
//  TSRelationAttentionFriendCell.m
//  TingShuo04-21
//
//  Created by �� � on 13-4-23.
//  Copyright (c) 2013�� ���Ƹ�. All rights reserved.
//
#import "AFNetDataCacheManager.h"

static AFNetDataCacheManager * instance;

@implementation AFNetDataCacheManager

-(id) init
{
    self = [super init];
    if (self) 
	{
        cacheDic=[[NSMutableDictionary alloc] init];
        cacheArray=[[NSMutableArray alloc] init]; 
    }
    return self;
}

+(AFNetDataCacheManager *) getInstance
{
    @synchronized(self) 
	{
        if (instance==nil) 
		{
            instance=[[AFNetDataCacheManager alloc] init];
        }
    }
    return instance;
}
//������Ϣ
-(void) sendNotificationWithKey:(NSString *) url Data:(NSData *) data index:(NSNumber*)index
{
    NSDictionary * post=[[NSDictionary alloc] initWithObjectsAndKeys:
                         url,   NSData,
                         data,  NSString, 
                         index, NSInteger,nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NetDataCacheNotification" object:post];
    [post release];
}

-(void)dealloc
{
    [cacheDic release];
    [cacheArray release];
    [super dealloc];
}
//ͨ��url��ȡ���ݲ���ֵcacheArray    cacheDic
-(void) getDataWithURL:(NSString *) url withIndex:(NSInteger)index
{
    if (url==nil||[url length]==0) {
        return ;
    }
    @synchronized(self) 
    {
        
    }
}

//��index����ʱ������ -1
-(void) getDataWithURL:(NSString *) url
{
    [self getDataWithURL:url withIndex:-1];
}
//xml
-(void) getXMLWithURL:(NSString *) url
{
   NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.groups.browse&api_key=b6300e17ad3c506e706cb0072175d047&cat_id=34427469792%40N01&format=rest"]];
   AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
       XMLParser.delegate = self;
      [XMLParser parse];
   } failure:nil];
  [operation start];
}
//image
-(void) getImageWithURL:(NSString *) url
{
	NSURL *url = [NSURL URLWithString:@"http://www.domain.com"]; 
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url]; 
	NSString *_path=[NSString stringWithFormat:@"/user_login/%@/%@/",userName,password]; 
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:_path parameters:nil]; 
	[httpClient release]; //��������·��  
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];   
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) { 
	//���d�ɹ�֮�ᣬʹ��JSONKit���ִ��D��NSDictionary��NSArray ��ʽ 
	NSDictionary *deserializedData = [operation.responseString objectFromJSONString];   
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) { 
	//���dʧ��֮��̎�� 
	}];   
	NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease]; 
	[queue addOperation:operation];

   //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
   //[imageView setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
}
//������ý��
-(void) getStreamWithURL:(NSString *) url
{
   NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8080/encode"]];
   AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
   operation.inputStream = [NSInputStream inputStreamWithFileAtPath:[[NSBundle mainBundle] pathForResource:@"large-image" ofType:@"tiff"]];
   operation.outputStream = [NSOutputStream outputStreamToMemory];
   [operation start];
}
//ͼƬ�ϴ���������ϴ�״̬
-(void) listenImageState
{
   NSURL *url = [NSURL URLWithString:@"http://api-base-url.com"];
   AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
   NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"avatar.jpg"], 0.5);
   NSMutableURLRequest *request = [httpClient multipartFormRequestWithMethod:@"POST" path:@"/upload" parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
       [formData appendPartWithFileData:imageData name:@"avatar" fileName:@"avatar.jpg" mimeType:@"image/jpeg"];
   }];
   AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
   [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
       NSLog(@"Sent %lld of %lld bytes", totalBytesWritten, totalBytesExpectedToWrite);
   }];
   [operation start];
}
//�ͷŴ洢����
-(void) freeMemory
{
    @synchronized(self) 
	{
        [cacheArray removeAllObjects];
        [cacheDic removeAllObjects];
    }
}



@end