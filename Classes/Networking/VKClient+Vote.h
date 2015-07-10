//
//  VKClient+Vote.h
//  VoatKit
//
//  Created by Christopher Luu on 7/9/15.
//
//

#import "VKClient.h"
#import "VKSubmission.h"
#import "VKComment.h"

@interface VKClient (Vote)

/**
 Submits an upvote vote for a submission.
 
 @param submission The submission to upvote.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)upvoteSubmission:(VKSubmission *)submission completion:(VKCompletionBlock)completion;

/**
 Submits a downvote vote for a submission.
 
 @param submission The submission to downvote.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)downvoteSubmission:(VKSubmission *)submission completion:(VKCompletionBlock)completion;

/**
 Revokes a vote for a submission.

 @param submission The submission to revoke the vote for.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)revokeVoteForSubmission:(VKSubmission *)submission completion:(VKCompletionBlock)completion;

/**
 Submits an upvote vote for the current user.
 
 @param comment The comment to upvote.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)upvoteComment:(VKComment *)comment completion:(VKCompletionBlock)completion;

/**
 Submits a downvote vote for the current user.
 
 @param comment The comment to downvote.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)downvoteComment:(VKComment *)comment completion:(VKCompletionBlock)completion;

/**
 Revokes a vote for a comment.
 
 @param comment The comment to revoke the vote for.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)revokeVoteForComment:(VKComment *)comment completion:(VKCompletionBlock)completion;

@end
