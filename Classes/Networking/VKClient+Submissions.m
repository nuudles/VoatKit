//
//  VKClient+Links.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Submissions.h"
#import "VKClient+Requests.h"
#import "VKSubmission.h"
#import "VKClient.h"
#import "VKClient+Errors.h"
#import "VKClient+Authentication.h"
#import "VKObjectBuilder.h"

@implementation VKClient (Submissions)

- (NSURLSessionDataTask *)frontPageSubmissionsWithSearchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self listingTaskWithPath:@"api/v1/v/_front" parameters:nil searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)submissionsInAllSubverseWithSearchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self listingTaskWithPath:@"api/v1/v/_all" parameters:nil searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)submissionsInSubverse:(VKSubverse *)subverse searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    return [self submissionsInSubverseWithName:subverse.name searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)submissionsInSubverseWithName:(NSString *)subverseName searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    NSParameterAssert(subverseName);
    
    NSString *path = [NSString stringWithFormat:@"api/v1/v/%@", subverseName];
    
    return [self listingTaskWithPath:path parameters:nil searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)submissionWithID:(NSNumber *)submissionID completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(submissionID);
    
    NSString *path = [NSString stringWithFormat:@"api/v1/submissions/%@", submissionID];
    
    return [self listingTaskWithPath:path parameters:nil searchOptions:nil completion:^(NSArray *links, VKSearchOptions *searchOptions, NSError *error) {
        if (!error)
        {
            completion([links firstObject], nil);
        }
        else
        {
            completion(nil, error);
        }
    }];
}

#pragma mark - Submitting

- (NSURLSessionDataTask *)submitLinkPostWithTitle:(NSString *)title subverse:(VKSubverse *)subverse URL:(NSURL *)URL completion:(VKObjectCompletionBlock)completion {
    return [self submitLinkPostWithTitle:title subverseName:subverse.name URL:URL completion:completion];
}

- (NSURLSessionDataTask *)submitLinkPostWithTitle:(NSString *)title subverseName:(NSString *)subverseName URL:(NSURL *)URL completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(title);
    NSParameterAssert(subverseName);
    NSParameterAssert(URL);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:2];
    
    [parameters setObject:title forKey:@"title"];
    [parameters setObject:[URL absoluteString] forKey:@"url"];

    
    return [self submissionSubmissionTaskWithParameters:parameters subverse:subverseName completion:completion];
}

- (NSURLSessionDataTask *)submitSelfPostWithTitle:(NSString *)title subverse:(VKSubverse *)subverse text:(NSString *)text completion:(VKObjectCompletionBlock)completion {
    return [self submitSelfPostWithTitle:title subverseName:subverse.name text:text completion:completion];
}

- (NSURLSessionDataTask *)submitSelfPostWithTitle:(NSString *)title subverseName:(NSString *)subverseName text:(NSString *)text completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(title);
    NSParameterAssert(subverseName);
    NSParameterAssert(text);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:2];
    [parameters setObject:title forKey:@"title"];
    [parameters setObject:text forKey:@"content"];
    
    return [self submissionSubmissionTaskWithParameters:parameters subverse:subverseName completion:completion];
}

- (NSURLSessionDataTask *)submissionSubmissionTaskWithParameters:(NSDictionary *)parameters subverse:(NSString*)subverse completion:(VKObjectCompletionBlock)completion
{
    return [self postPath:[NSString stringWithFormat:@"api/v1/v/%@", subverse] parameters:parameters completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        NSDictionary *responseDict = responseObject;
        id object = [VKObjectBuilder objectFromJSON:responseDict[@"data"]];
        completion(object, error);
    }];
}


@end
