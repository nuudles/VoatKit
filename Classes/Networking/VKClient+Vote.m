//
//  VKClient+Vote.m
//  VoatKit
//
//  Created by Christopher Luu on 7/9/15.
//
//

#import "VKClient+Vote.h"
#import "VKClient+Requests.h"
#import "VKClient+Errors.h"

typedef NS_ENUM(NSInteger, VKVote)
{
    VKVoteDownvote = -1,
    VKVoteRevoke = 0,
    VKVoteUpvote = 1
};

static NSString *const VKClientVoteTypeComment = @"comment";
static NSString *const VKClientVoteTypeSubmission = @"submission";

@implementation VKClient (Vote)

- (NSURLSessionDataTask *)upvoteSubmission:(VKSubmission *)submission completion:(VKCompletionBlock)completion
{
    NSParameterAssert(submission);
    return [self submitVote:VKVoteUpvote forType:VKClientVoteTypeSubmission withID:submission.submissionID completion:completion];
}

- (NSURLSessionDataTask *)downvoteSubmission:(VKSubmission *)submission completion:(VKCompletionBlock)completion
{
    NSParameterAssert(submission);
    return [self submitVote:VKVoteDownvote forType:VKClientVoteTypeSubmission withID:submission.submissionID completion:completion];
}

- (NSURLSessionDataTask *)revokeVoteForSubmission:(VKSubmission *)submission completion:(VKCompletionBlock)completion
{
    NSParameterAssert(submission);
    return [self submitVote:VKVoteRevoke forType:VKClientVoteTypeSubmission withID:submission.submissionID completion:completion];
}

- (NSURLSessionDataTask *)upvoteComment:(VKComment *)comment completion:(VKCompletionBlock)completion
{
    NSParameterAssert(comment);
    return [self submitVote:VKVoteUpvote forType:VKClientVoteTypeComment withID:comment.commentID completion:completion];
}

- (NSURLSessionDataTask *)downvoteComment:(VKComment *)comment completion:(VKCompletionBlock)completion
{
    NSParameterAssert(comment);
    return [self submitVote:VKVoteDownvote forType:VKClientVoteTypeComment withID:comment.commentID completion:completion];
}

- (NSURLSessionDataTask *)revokeVoteForComment:(VKComment *)comment completion:(VKCompletionBlock)completion
{
    NSParameterAssert(comment);
    return [self submitVote:VKVoteRevoke forType:VKClientVoteTypeComment withID:comment.commentID completion:completion];
}

- (NSURLSessionDataTask *)submitVote:(VKVote)vote forType:(NSString *)type withID:(NSNumber *)contentID completion:(VKCompletionBlock)completion
{
    return [self postPath:[NSString stringWithFormat:@"api/v1/vote/%@/%@/%d", type, contentID, vote] parameters:nil completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        if (error != nil) {
            completion(error);
            return;
        }
        NSDictionary *dataDictionary = responseObject[@"data"];
        if ([dataDictionary[@"success"] boolValue] == YES) {
            completion(nil);
            return;
        }

        NSError *newError = [NSError errorWithDomain:VKClientErrorDomain code:VKClientErrorPermissionDenied userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(dataDictionary[@"message"], @"")}];
        completion(newError);
    }];
}

@end
