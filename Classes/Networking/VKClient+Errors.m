//
//  VKClient+Errors.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Errors.h"

@implementation VKClient (Errors)

const NSInteger VKClientErrorAuthenticationFailed = 1;

const NSInteger VKClientErrorInvalidCredentials = 203;
const NSInteger VKClientErrorRateLimited = 204;

const NSInteger VKClientErrorInvalidName = 401;
const NSInteger VKClientErrorPermissionDenied = 401;
const NSInteger VKClientErrorConflict = 401;
const NSInteger VKClientErrorRecordNotFound = 404;

const NSInteger VKClientErrorInternalServerError = 501;
const NSInteger VKClientErrorBadGateway = 502;
const NSInteger VKClientErrorServiceUnavailable = 503;
const NSInteger VKClientErrorTimedOut = 504;
const NSInteger VKClientErrorNotImplemented = 501;

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
    
    if (![json objectForKey:@"error"]) //Does not have an error key
        return nil;
    
    NSLog(@"HAS ERROR: %@", responseString);
    
    if ([VKClient string:responseString containsSubstring:@"Api key is missing or invalid"]) return [VKClient authenticationRequiredError];
    
    switch (response.statusCode)
    {
        case 400:
            if ([VKClient string:responseString containsSubstring:@"Credentials not found."]) return [VKClient invalidCredentialsError];
            if ([VKClient string:responseString containsSubstring:@"ApiThrottleLimit"]) return [VKClient rateLimitedError];
            if ([VKClient string:responseString containsSubstring:@"NotFound"]) return [VKClient invalidNameError];
            
            break;
        case 403:
            if ([VKClient string:responseString containsSubstring:@"USER_REQUIRED"]) return [VKClient authenticationRequiredError];
            
            return [VKClient permissionDeniedError];
            break;
        case 404:
            return [VKClient recordNotFound];
            break;
        case 409:
            return [VKClient conflictError];
            break;
        case 500:
            return [VKClient internalServerError];
            break;
        case 501:
            return [VKClient notImplemented];
            break;
        case 502:
            return [VKClient badGatewayError];
            break;
        case 503:
            return [VKClient serviceUnavailableError];
            break;
        case 504:
            return [VKClient timedOutError];
            break;
        default:
            break;
    }
    
    
    if ([VKClient string:responseString containsSubstring:@"error_description"]) return [VKClient permissionDeniedError];
    
    
    
    return nil;
}


+ (NSError *)authenticationRequiredError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Authentication required" failureReason:@"This method requires you to be signed in."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorAuthenticationFailed userInfo:userInfo];
}

+ (NSError *)invalidCredentialsError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Invalid credentials" failureReason:@"Your username or password were incorrect."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorInvalidCredentials userInfo:userInfo];
}

+ (NSError *)rateLimitedError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Rate limited" failureReason:@"You have exceeded voat's rate limit."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorRateLimited userInfo:userInfo];
}

+ (NSError *)permissionDeniedError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Permission denied" failureReason:@"You don't have permission to access this resource."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorPermissionDenied userInfo:userInfo];
}

+ (NSError *)conflictError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Conflict" failureReason:@"Your attempt to create a resource caused a conflict."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorConflict userInfo:userInfo];
}

+ (NSError *)internalServerError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Internal server error" failureReason:@"The voat servers suffered an internal server error."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorInternalServerError userInfo:userInfo];
}

+ (NSError *)badGatewayError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Bad gateway" failureReason:@"Bad gateway."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorBadGateway userInfo:userInfo];
}

+ (NSError *)serviceUnavailableError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Service unavailable" failureReason:@"The voat servers are unavailable."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorServiceUnavailable userInfo:userInfo];
}

+ (NSError *)timedOutError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Timed out" failureReason:@"The voat servers timed out."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorTimedOut userInfo:userInfo];
}

+ (NSError *)invalidNameError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Invalid name" failureReason:@"The name provided for the object was invalid."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorInvalidName userInfo:userInfo];
}

+ (NSError *)notImplemented
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Not Implemented" failureReason:@"This feature has not yet been implemented by Voat.co"];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorNotImplemented userInfo:userInfo];
}

+ (NSError *)unkownError
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Unkown error" failureReason:@"An unkown error has occured."];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientUnkownError userInfo:userInfo];
}

+ (NSError *)recordNotFound
{
    NSDictionary *userInfo = [VKClient userInfoWithDescription:@"Record not found." failureReason:@"The requested record was not found by voat"];
    return [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorRecordNotFound userInfo:userInfo];
}

#pragma mark - Private

+ (BOOL)string:(NSString *)string containsSubstring:(NSString *)substring
{
    NSRange range = [string rangeOfString:substring];
    return (range.location != NSNotFound);
}

+ (NSDictionary *)userInfoWithDescription:(NSString *)description failureReason:(NSString *)failureReason
{
    return @{NSLocalizedDescriptionKey: NSLocalizedString(description, @""), NSLocalizedFailureReasonErrorKey: NSLocalizedString(failureReason, @"") };
}



@end
