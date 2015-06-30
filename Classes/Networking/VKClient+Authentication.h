//
//  VKClient+Authentication.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKUser.h"

@interface VKClient (Authentication)

/**
 Signs into voat.
 
 @param username The user's username.
 @param password The user's password.
 @param completion The block to be executed upon completion of the request. Its only argument is any error that occured
 
 @note This method signs out the current client before attempting to sign in.
 */
- (NSURLSessionDataTask *)signInWithUsername:(NSString *)username password:(NSString *)password completion:(VKCompletionBlock)completion;

/**
 Creates an Auth session based on an existing token, username, and password. Useful for persisting data.
 
 @param username The user's username.
 @param password The user's password.
 @param token The user's token.
 @param token The user's token type.
 @param completion The block to be executed upon completion of the request. Its only argument is any error that occured

 @note: this does not make a request to the voat.co API, instead it sets local variables. The only 'authentication' that happens is the verification that the username exists when the method makes its userWithUsername call.
 @note This method signs out the current client before attempting to sign in.
 */
- (NSURLSessionDataTask *)signInWithUsername:(NSString *)username password:(NSString *)password token:(NSString*)token tokenType:(NSString*)tokenType expirationDate:(NSDate*)expirationDate completion:(VKCompletionBlock)completion;

/**
 Generates a new token for the same user.
 
 @param completion The block to be executed upon completion of the request. Its only argument is any error that has occured
  */
- (NSURLSessionDataTask *)updateToken:(VKCompletionBlock)completion;

/**
 Checks if the token is still valid or has expired. If the token is expiring in 10 minutes or less it will call updateToken automatically
 */
- (BOOL)isValidToken;

/**
 Whether or not there is a user currently signed in.
 
 @note This returns YES if there is an existing modhash value, but cannot guarantee its validity.
 */
- (BOOL)isSignedIn;

/**
 Signs the current user out.
 */
- (void)signOut;

@end
