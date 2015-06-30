//
//  VKClient+Errors.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"

@interface VKClient (Errors)

extern const NSInteger VKClientErrorAuthenticationFailed;

extern const NSInteger VKClientErrorInvalidCredentials;
extern const NSInteger VKClientErrorRateLimited;

extern const NSInteger VKClientErrorInvalidName;
extern const NSInteger VKClientErrorPermissionDenied;
extern const NSInteger VKClientErrorConflict;

extern const NSInteger VKClientErrorInternalServerError;
extern const NSInteger VKClientErrorBadGateway;
extern const NSInteger VKClientErrorServiceUnavailable;
extern const NSInteger VKClientErrorTimedOut;
extern const NSInteger VKClientErrorNotImplemented;

extern const NSInteger VKClientUnkownError;

/**
 Returns any errors found in a response.
 */
+ (NSError *)errorFromResponse:(NSHTTPURLResponse *)response responseString:(NSString *)responseString;

/**
 Returns an error that occurs when there is no user signed in and an attempt is made to access a resouce which requires authentication.
 For example, this error occurs when attempting to retrieve a list of subscribed subverses without being signed in.
 */
+ (NSError *)authenticationRequiredError;

/**
 Returns an error that occurs when the user attempts to sign in but either the username or password were incorrect.
 */
+ (NSError *)invalidCredentialsError;

/**
 Returns an error that occurs when the user is rate limited.
 */
+ (NSError *)rateLimitedError;

/**
 Returns an error that occurs when you provide an invalid subverse name.
 */
+ (NSError *)invalidNameError;

/**
 Returns an error that occurs when the user was denied access to a particular resource, such as a subverses.
 */
+ (NSError *)permissionDeniedError;

/**
 Returns an error that occurs when the voat servers are unavailable.
 */
+ (NSError *)serviceUnavailableError;

/**
 Returns an error that occurs when the voat servers timed out.
 */
+ (NSError *)timedOutError;

/**
 Returns an error the voat API returns 501 not implemented
 */
+ (NSError *)notImplemented;

/**
 Returns an error that occurs when we know there's an error but it does not fit any error type
 */
+ (NSError *)unkownError;
@end
