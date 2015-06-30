//
//  VKResponseSerializer.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKResponseSerializer.h"

#import "VKClient.h"
#import "VKClient+Errors.h"

@implementation VKResponseSerializer

- (instancetype)init
{
    if (self = [super init])
    {
        self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/css", nil];
    }
    
    return self;
}

#pragma mark - AFURLRequestSerialization

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError **)error
{    
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    if ([[[response allHeaderFields] objectForKey:@"Content-Type"] rangeOfString:@"application/json"].location == NSNotFound) {
        return nil;
    }
    
    // Attempt to parse the JSON:
    
    NSError *parseError = nil;
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parseError];
    
    if (parseError) {
        NSError *responseError = [VKClient errorFromResponse:(NSHTTPURLResponse *)response responseString:responseString];
        
        if (responseError && error != NULL)
        {
            *error = responseError;
            return nil;
        }
    }
    else {
        NSError *responseError = [VKClient errorFromResponse:(NSHTTPURLResponse *)response responseString:responseString];
        
        if (responseError && error != NULL)
        {
            *error = responseError;
            return nil;
        }
    }
    
    return responseObject;

}

@end
