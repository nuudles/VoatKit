//
//  VKClient+Comments.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Comments.h"
#import "VKClient+Requests.h"

@implementation VKClient (Comments)

#pragma mark - Getting Comments

- (NSURLSessionDataTask *)commentsForSubmission:(VKSubmission *)submission searchOptions:(VKSearchOptions*)searchOptions completion:(VKArrayCompletionBlock)completion {
    NSParameterAssert(submission);
    
    return [self commentsForSubmissionWithIdentifier:submission.submissionID withSubverse:submission.subverse searchOptions:searchOptions completion:completion];
}

- (NSURLSessionDataTask *)commentsForSubmissionWithIdentifier:(NSNumber *)submissionIdentifier withSubverse:(NSString*)subverse searchOptions:(VKSearchOptions*)searchOptions completion:(VKArrayCompletionBlock)completion {
    NSParameterAssert(submissionIdentifier);
    NSParameterAssert(subverse);
    
    return [self arrayTaskWithPath:[NSString stringWithFormat:@"api/v1/v/%@/%@/comments", subverse, submissionIdentifier] parameters:nil searchOptions:searchOptions completion:completion];
}

#pragma mark - Submitting Comments

- (NSURLSessionDataTask *)submitComment:(NSString *)commentText onSubmission:(VKSubmission *)submission completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(commentText);
    NSParameterAssert(submission);
    
    return [self submitComment:commentText onSubmissionWithIdentifier:submission.submissionID withSubverse:submission.subverse completion:completion];
}

- (NSURLSessionDataTask *)submitComment:(NSString *)commentText onSubmissionWithIdentifier:(NSNumber *)submissionIdentifier withSubverse:(NSString*)subverse completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(commentText);
    NSParameterAssert(submissionIdentifier);
    NSParameterAssert(subverse);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:2];
    [parameters setObject:commentText forKey:@"value"];
    
    return [self postWithResponse:[NSString stringWithFormat:@"api/v1/v/%@/%@/comment", subverse, submissionIdentifier] parameters:parameters completion:completion];
}

- (NSURLSessionDataTask *)submitComment:(NSString *)commentText asReplyToComment:(VKComment *)comment completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(commentText);
    NSParameterAssert(commentText);
    
    return [self submitComment:commentText asReplyToComment:comment.commentID withSubmissionIdentifier:comment.submissionID withSubverse:comment.subverse completion:completion];
}

- (NSURLSessionDataTask *)submitComment:(NSString *)commentText asReplyToComment:(NSNumber *)commentID withSubmissionIdentifier:(NSNumber*)submissionIdentifier withSubverse:(NSString*)subverse completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(commentText);
    NSParameterAssert(commentID);
    NSParameterAssert(submissionIdentifier);
    NSParameterAssert(subverse);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:2];
    [parameters setObject:commentText forKey:@"value"];
    
    return [self postWithResponse:[NSString stringWithFormat:@"api/v1/v/%@/%@/comment/%@", subverse, submissionIdentifier, commentID] parameters:parameters completion:completion];
}

@end
