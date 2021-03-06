//  RORequestParam.m
//  Renren Open-platform
//
//  Created by xiawenhai on 11-8-12.
//  Copyright 2011年 Renren Inc. All rights reserved.
//  - Powered by Team Pegasus. -
//
#import "RORequestParam.h"
#import "Renren.h"
#import "ROUtility.h"

@implementation RORequestParam
@synthesize method = _method;
@synthesize format = _format;
@synthesize apiVersion = _apiVersion;
@synthesize apiKey = _apiKey;
@synthesize sessionKey = _sessionKey;
@synthesize callID = _callID;
@synthesize sig = _sig;
@synthesize xn_ss = _xn_ss;

@synthesize v;
@synthesize access_token;
@synthesize call_id;

-(id)init
{
	if (self = [super init]) {
		self.format = [NSString stringWithFormat:@"JSON"];
		self.apiVersion = kSDKversion;
		self.xn_ss = [NSString stringWithFormat:@"1"];
	}
	
	return self;
}

-(NSMutableDictionary*)requestParamToDictionary
{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.format,@"format",
																						self.apiVersion,@"v",
																						self.method,@"method",
																						self.apiKey,@"api_key",
																						self.sessionKey,@"session_key",
																						self.callID,@"call_id",
																						self.xn_ss,@"xn_ss",
                                                   self.v,@"v",      self.access_token,@"access_token",         self.call_id,@"call_id",nil];
	
	if (self.sig != nil && ![self.sig isEqualToString:@""]) {
		[dictionary setObject:self.sig forKey:@"sig"];
	}
	
	[self addParamToDictionary:dictionary];
	
	return dictionary;
}

-(void)addParamToDictionary:(NSMutableDictionary*)dictionary
{
	return;
}

-(ROResponse*)requestResultToResponse:(id)result
{
	id responseObject = nil;
	if (![result isKindOfClass:[NSArray class]]) {
		if ([result objectForKey:@"error"] != nil) {
			responseObject = [ROError errorWithOAuthResult:result];
			return [ROResponse responseWithError:responseObject];
		}
	}
    
	return [ROResponse responseWithRootObject:result];
}

-(void)dealloc
{
	self.method = nil;
	self.format = nil;
	self.apiVersion = nil;
	self.apiKey = nil;
	self.sessionKey = nil;
	self.callID = nil;
	self.sig = nil;
	self.xn_ss = nil;
	[super dealloc];
}

@end
