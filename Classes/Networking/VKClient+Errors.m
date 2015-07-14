//
//  VKClient+Errors.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Errors.h"

@implementation VKClient (Errors)


const NSInteger VKClientHTTPErrorBadRequest = 400;
const NSInteger VKClientHTTPErrorForbidden = 403;
const NSInteger VKClientHTTPErrorConflict = 409;
const NSInteger VKClientHTTPErrorUnauthorized = 401;
const NSInteger VKClientHTTPErrorNotFound = 404;

const NSInteger VKServerHTTPErrorInternalServer = 500;
const NSInteger VKServerHTTPErrorServiceUnavailable = 503;
const NSInteger VKServerHTTPErrorGatewayTimeout = 504;
const NSInteger VKServerHTTPErrorNotImplemented = 501;

const NSInteger VKRequestErrorAPIThrottleError = 429;
const NSInteger VKRequestErrorInvalidAPIKey = 202;
const NSInteger VKRequestErrorDisabledRestricted = 203;
const NSInteger VKRequestErrorRecordNotFound = 204;

const NSInteger VKClientErrorInvalidCredentials = 422;
const NSInteger VKClientUnkownError = -1;

+ (NSError *)errorFromResponse:(NSHTTPURLResponse *)response responseString:(NSString *)responseString {
    NSParameterAssert(response);
    NSParameterAssert(responseString);
    
    NSError *jsonError;
    NSData *responseData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    if (jsonError)
        return jsonError;
    
    if ([VKClient string:responseString containsSubstring:@"Api key is missing or invalid"]) return [VKClient apiKeyError];
    
    if ([VKClient string:responseString containsSubstring:@"ApiThrottleLimit"]) return [VKClient apiThrottleError];
    
    
    switch (response.statusCode) {
        case 400:
            if ([VKClient string:responseString containsSubstring:@"Credentials not found."]) return [VKClient invalidCredentialsError];
            
            return [self badRequestError];
            break;
        case 403:
            if ([VKClient string:responseString containsSubstring:@"USER_REQUIRED"]) return [VKClient unauthorizedError];
            
            return [self forbiddenError];
            break;
        case 409:
            return [self conflictError];
            break;
        case 401:
            return [self unauthorizedError];
            break;
        case 404:
            if ([json[@"error"][@"type"] isEqualToString:@"NotFound"]) return [self recordNotFoundError];
            return [self notFoundError];
            break;
        case 429:
            return [self apiThrottleError];
            break;
        case 500:
            return [self internalServerError];
            break;
        case 503:
            return [self serviceUnavailableError];
            break;
        case 504:
            return [self gatewayTimeoutError];
            break;
        case 501:
            return [self notImplementedError];
            break;
        default:
            break;
    }
    
    if (json[@"error"]) return [VKClient unkownErrorWithMessage:json[@"error"][@"message"]];
    
    return nil;
}


+ (NSError *)badRequestError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Bad Request" failureReason:@"This request was invalid and can not be completed."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientHTTPErrorBadRequest userInfo:userInfo];
}

+ (NSError *)forbiddenError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Forbidden" failureReason:@"This request does not have the necessary permissions to be completed."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientHTTPErrorForbidden userInfo:userInfo];
}

+ (NSError *)conflictError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Conflict" failureReason:@"This request could not be completed because of conflict in the request."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientHTTPErrorConflict userInfo:userInfo];
}

+ (NSError *)unauthorizedError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Unauthorized" failureReason:@"This request does not have the authorization to be performed."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientHTTPErrorUnauthorized userInfo:userInfo];
}

+ (NSError *)notFoundError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Not Found" failureReason:@"The requested endpoint does not exist."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientHTTPErrorNotFound userInfo:userInfo];
}

+ (NSError *)internalServerError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Internal Server Error" failureReason:@"An internal server error has occured."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKServerHTTPErrorInternalServer userInfo:userInfo];
}

+ (NSError *)serviceUnavailableError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Service Unavailable" failureReason:@"This method requires you to be signed in."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKServerHTTPErrorServiceUnavailable userInfo:userInfo];
}

+ (NSError *)gatewayTimeoutError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Service Unavailable" failureReason:@"The requested service is not available."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKServerHTTPErrorGatewayTimeout userInfo:userInfo];
}

+ (NSError *)notImplementedError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Not Implemented" failureReason:@"This request has not been implemented by the service."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKServerHTTPErrorNotImplemented userInfo:userInfo];
}

+ (NSError *)apiThrottleError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"API Throttle Error" failureReason:@"This client is making too many requests."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKRequestErrorAPIThrottleError userInfo:userInfo];
}

+ (NSError *)apiKeyError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Invalid API Key" failureReason:@"The API key provided with this request is invalid"];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKRequestErrorInvalidAPIKey userInfo:userInfo];
}

+ (NSError *)apiDisabledRestrictedError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"API Disabled / Restricted" failureReason:@"The API has been disabled or restricted."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKRequestErrorDisabledRestricted userInfo:userInfo];
}

+ (NSError *)recordNotFoundError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Record Not Found" failureReason:@"The requested record does not exist."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientHTTPErrorNotFound userInfo:userInfo];
}

+ (NSError *)invalidCredentialsError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Invalid credentials" failureReason:@"Your username or password were incorrect."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorInvalidCredentials userInfo:userInfo];
}

+ (NSError *)unkownError {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Unkown error" failureReason:@"An unkown error has occured."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientUnkownError userInfo:userInfo];
}

+ (NSError *)unkownErrorWithMessage:(NSString*)message {
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Unkown error" failureReason:message];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientUnkownError userInfo:userInfo];
}

#pragma mark - Private

+ (BOOL)string:(NSString *)string containsSubstring:(NSString *)substring {
    NSRange range = [string rangeOfString:substring];
    return (range.location != NSNotFound);
}

+ (NSDictionary *)userInfoWithDescription:(NSString *)description failureReason:(NSString *)failureReason {
    return @{NSLocalizedDescriptionKey: NSLocalizedString(description, @""), NSLocalizedFailureReasonErrorKey: NSLocalizedString(failureReason, @"") };
}

@end
