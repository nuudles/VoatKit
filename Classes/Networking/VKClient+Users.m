
//
//  VKClient+User.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Users.h"
#import "VKClient+Requests.h"
#import "VKObjectBuilder.h"
#import "VKClient+Authentication.h"
#import "VKClient+Errors.h"

@implementation VKClient (Users)

- (NSURLSessionDataTask *)currentUserWithCompletion:(VKObjectCompletionBlock)completion {
    return [self userWithUsername:self.currentUser.username completion:completion];
}

- (NSURLSessionDataTask *)savedItemsForCurrentUser:(VKListingCompletionBlock)completion {
    //TODO: CHECK API TO SEE IF IMPLEMENTED: http://fakevout.azurewebsites.net/api/help/api/get-api-v1-u-saved
    if (![self isSignedIn])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion(nil, nil, [VKClient unauthorizedError]);
            }
        });
        
        return nil;
    }
    
    return nil;
}

- (NSURLSessionDataTask *)user:(VKUser *)user completion:(VKObjectCompletionBlock)completion {
    return [self userWithUsername:user.username completion:completion];
}


- (NSURLSessionDataTask *)userWithUsername:(NSString *)username completion:(VKObjectCompletionBlock)completion {
    return [self getWithResponse:[NSString stringWithFormat:@"api/v1/u/%@/info", username] parameters:nil completion:completion];
}

#pragma mark - User Content
- (NSURLSessionDataTask *)commentsByUser:(VKUser *)user searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self commentsByUserWithUsername:user.username searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)commentsByUserWithUsername:(NSString *)username searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self listingTaskWithPath:[NSString stringWithFormat:@"api/v1/u/%@/comments", username] parameters:nil searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)submissionsByUser:(VKUser *)user searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self submissionsByUserWithUsername:user.username searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)submissionsByUserWithUsername:(NSString *)username searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
     return [self listingTaskWithPath:[NSString stringWithFormat:@"api/v1/u/%@/submissions", username] parameters:nil searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)subscriptionsForUser:(VKUser *)user searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self subscriptionsForUserWithUsername:user.username searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)subscriptionsForUserWithUsername:(NSString *)username searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self listingTaskWithPath:[NSString stringWithFormat:@"api/v1/u/%@/subscriptions", username] parameters:nil searchOptions:searchOptions completion:completion];
}

@end
