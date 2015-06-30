//
//  VKClient+Subverses.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Subverses.h"
#import "VKClient+Requests.h"

@implementation VKClient (Subverses)

#pragma mark - Getting Subverses
- (NSURLSessionDataTask *)subverseWithName:(NSString *)subverseName completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(subverseName);
    return [self getWithResponse:[NSString stringWithFormat:@"api/v1/v/%@/info", subverseName] parameters:nil completion:completion];
}

- (NSURLSessionDataTask *)blockSubverseFromAll:(VKSubverse *)subverse completion:(VKCompletionBlock)completion {
    return [self blockSubverseFromAllWithName:subverse.name completion:completion];
}

- (NSURLSessionDataTask *)blockSubverseFromAllWithName:(NSString *)subverseName completion:(VKCompletionBlock)completion {
    return [self basicPostTaskWithPath:[NSString stringWithFormat:@"api/v1/v/%@/block", subverseName] parameters:nil completion:completion];
}

- (NSURLSessionDataTask *)unblockSubverseFromAll:(VKSubverse *)subverse completion:(VKCompletionBlock)completion {
    return [self unblockSubverseFromAllWithName:subverse.name completion:completion];
}

- (NSURLSessionDataTask *)unblockSubverseFromAllWithName:(NSString *)subverseName completion:(VKCompletionBlock)completion {
    return [self deletePath:[NSString stringWithFormat:@"api/v1/v/%@/block", subverseName] parameters:nil completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        completion(error);
    }];
}

@end
