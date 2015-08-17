//
//  VKClient+Comments.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKSubmission.h"
#import "VKComment.h"
#import "VKSearchOptions.h"

@interface VKClient (Comments)


#pragma mark - Getting Comments

/**
 Gets all comments for a submision. Defaults to VKCommentSortTop sort order.
 
 @param submission The submission.
 @param completion An optional block to be executed upon request completion. It takes two arguments: an array of VKComments and any error that occurred.
 @param searchOptions The search options specifying the order of the response
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)commentsForSubmission:(VKSubmission *)submission searchOptions:(VKSearchOptions*)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets all comments for a submision. Defaults to VKCommentSortTop sort order.
 
 @param submissionIdentifier The submission.
 @param subverse The subverse to which this submission belongs.
 @param searchOptions The search options specifying the order of the response
 @param completion An optional block to be executed upon request completion. It takes two arguments: an array of VKComments and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)commentsForSubmissionWithIdentifier:(NSNumber *)submissionIdentifier withSubverse:(NSString*)subverse searchOptions:(VKSearchOptions*)searchOptions completion:(VKListingCompletionBlock)completion;


#pragma mark - Submitting Comments

/**
 Submit a comment on a submission.
 
 @param commentText The body of the comment, as Markdown.
 @param submission The submission on which to comment.
 @param completion An optional block to be executed upon request completion. Its arguments are a VKComment object and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitComment:(NSString *)commentText onSubmission:(VKSubmission *)submission completion:(VKObjectCompletionBlock)completion;

/**
 Submit a comment on a submission.
 
 @param commentText The body of the comment, as Markdown.
 @param submissionIdentifier The submissionIdentifier on which to comment.
 @param subverse The subverse on which to comment.
 @param completion An optional block to be executed upon request completion. Its arguments are a VKComment object and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitComment:(NSString *)commentText onSubmissionWithIdentifier:(NSNumber *)submissionIdentifier withSubverse:(NSString*)subverse completion:(VKObjectCompletionBlock)completion;

/**
 Submit a comment as a reply to another comment.
 
 @param commentText The body of the comment, as Markdown.
 @param comment The comment.
 @param completion An optional block to be executed upon request completion. Its arguments are a VKComment object and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitComment:(NSString *)commentText asReplyToComment:(VKComment *)comment completion:(VKObjectCompletionBlock)completion;

/**
 Submit a comment as a reply to another comment.
 
 @param commentText The body of the comment, as Markdown.
 @param comment The comment.
 @param completion An optional block to be executed upon request completion. Its arguments are a VKComment object and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitComment:(NSString *)commentText asReplyToComment:(NSNumber *)commentID withSubmissionIdentifier:(NSNumber*)submissionIdentifier withSubverse:(NSString*)subverse completion:(VKObjectCompletionBlock)completion;

@end
