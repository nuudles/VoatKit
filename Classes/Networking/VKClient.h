//
//  VKClient.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "VKCompletionBlocks.h"
#import "VKUser.h"

extern NSString * const VKClientErrorDomain;

//TODO: implement throttle limit
@interface VKClient : AFHTTPSessionManager

/**
 The currently signed in user.
 */
@property (nonatomic, strong) VKUser *currentUser;

/**
 The access token for the current user.
 */
@property (nonatomic, copy) NSString *accessToken;

/**
 The token type for the accessToken.
 */
@property (nonatomic, strong) NSString *tokenType;

/**
 The expiration date for the accessToken.
 */
@property (nonatomic, strong) NSDate *expirationDate;

/**
 The password for the current user
 @note: VoatKit does not currently persist this data itself; this should be implemented in a keychain by the client.
 */
@property (nonatomic, strong) NSString *password;

/**
 The user agent for requests sent to voat.co.
 */
@property (nonatomic, strong) NSString *userAgent;

/**
 The clients API Key.
 */
@property (nonatomic, strong) NSString *apiKey;

+ (instancetype)sharedClient;

/**
 The URL to base HTTPS requests on. Override this in an RKClient subclass to change the base HTTPS URL.
 */
+ (NSURL *)APIBaseHTTPSURL;

@end
