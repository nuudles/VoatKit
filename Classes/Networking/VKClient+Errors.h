//
//  VKClient+Errors.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"

@interface VKClient (Errors)

extern const NSInteger VKClientHTTPErrorBadRequest;
extern const NSInteger VKClientHTTPErrorForbidden;
extern const NSInteger VKClientHTTPErrorConflict;
extern const NSInteger VKClientHTTPErrorUnauthorized;
extern const NSInteger VKClientHTTPErrorNotFound;

extern const NSInteger VKServerHTTPErrorInternalServer;
extern const NSInteger VKServerHTTPErrorServiceUnavailable;
extern const NSInteger VKServerHTTPErrorGatewayTimeout;
extern const NSInteger VKServerHTTPErrorNotImplemented;

extern const NSInteger VKRequestErrorAPIThrottleError;
extern const NSInteger VKRequestErrorInvalidAPIKey;
extern const NSInteger VKRequestErrorDisabledRestricted;
extern const NSInteger VKRequestErrorRecordNotFound;

extern const NSInteger VKClientErrorInvalidCredentials;
extern const NSInteger VKClientUnkownError;

/**
 Returns any errors found in a response.
 */
+ (NSError *)errorFromResponse:(NSHTTPURLResponse *)response responseString:(NSString *)responseString;


/**
 Returns an error when Voat returns a 400 Bad Error. This can occur when a request is formatted incorrectly.
 */
+ (NSError *)badRequestError;

/**
 Returns an error when Voat returns a 403 Forbidden Error. This can occur when the user is not authenticated/authorized for a recource or action.
 */
+ (NSError *)forbiddenError;

/**
 Returns an error when Voat returns a 409 Conflict Error. When this occurs the action/request was not performed because of a conflict on Voat's servers.
 */
+ (NSError *)conflictError;

/**
 Returns an error when Voat returns a 401 Forbidden Error. This can occur when the user is not authenticated/authorized for a recource or action.
 */
+ (NSError *)unauthorizedError;

/**
 Returns an error when Voat returns a 404 Not Found. This can occur when requesting a nonexistant endpoint.
 */
+ (NSError *)notFoundError;

/**
 Returns an error when Voat returns a 500 Internal Server Error.
 */
+ (NSError *)internalServerError;

/**
 Returns an error when Voat returns a 503 Service Unavailable Error. This can occur when the API is disabled.
 */
+ (NSError *)serviceUnavailableError;

/**
 Returns an error when Voat returns a 504 Gateway Timeout Error.
 */
+ (NSError *)gatewayTimeoutError;

/**
 Returns an error when Voat returns a 501 Not Implemented Error. This can occur if requesting an endpoint that hasn't been implemented.
 */
+ (NSError *)notImplementedError;

/**
 Returns an error when the client has reached their throttle limit.
 */
+ (NSError *)apiThrottleError;

/**
 Returns an error when an invalid API key was sent with the request.
 */
+ (NSError *)apiKeyError;

/**
 Returns an error when the API is disabled or restricted.
 */
+ (NSError *)apiDisabledRestrictedError;

/**
 Returns an error when the requested record could not be found (404).
 */
+ (NSError *)recordNotFoundError;

/**
 Returns an error that occurs when the user attempts to sign in but either the username or password were incorrect.
 */
+ (NSError *)invalidCredentialsError;

/**
 Returns an error that occurs when we know there's an error but it does not fit any error type
 */
+ (NSError *)unkownError;

/**
 Returns an error that occurs when we know there's an error but it does not fit any error type. Includes the error message.
 */
+ (NSError *)unkownErrorWithMessage:(NSString*)message;

@end
