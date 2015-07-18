//
//  VKClient.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKResponseSerializer.h"
#import "VKUser.h"

NSString * const VKClientErrorDomain = @"VKClientErrorDomain";

@interface VKClient ()
@end

@implementation VKClient

+ (instancetype)sharedClient
{
    static VKClient *sharedRKClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedRKClient = [[VKClient alloc] init];
    });
    
    return sharedRKClient;
}

- (id)init
{
    if (self = [super initWithBaseURL:[[self class] APIBaseHTTPSURL]])
    {
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        self.requestSerializer = requestSerializer;
        self.responseSerializer = [VKResponseSerializer serializer];
        
        
        
        AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        policy.allowInvalidCertificates = YES;
        self.securityPolicy = policy;
    }
    
    return self;
}

- (void)setAccessToken:(NSString *)accessToken {
    if(accessToken) {
        _accessToken = [accessToken copy];
        [[self requestSerializer] setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    } else {
        _accessToken = nil;
        [[self requestSerializer] setValue:@"" forHTTPHeaderField:@"Authorization"];
    }
    
}

-(void)setApiKey:(NSString *)apiKey
{
    _apiKey = [apiKey copy];
    [[self requestSerializer] setValue:_apiKey forHTTPHeaderField:@"Voat-ApiKey"];
}

- (void)setUserAgent:(NSString *)userAgent
{
    _userAgent = [userAgent copy];
    [[self requestSerializer] setValue:_userAgent forHTTPHeaderField:@"User-Agent"];
}

+ (NSURL *)APIBaseHTTPSURL {
    //this is temporary.... the voat beta api site is private
    /*NSString *path = [[NSBundle mainBundle] pathForResource: @"keys" ofType: @"plist"];
     NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
     
     return [dict objectForKey:@"apiBaseURL"];*/
    
    return [NSURL URLWithString:@"https://fakevout.azurewebsites.net/"];
}

- (void)setCurrentUser:(VKUser *)currentUser {
    _currentUser = currentUser;
}

@end
