//
//  VKClient+Links.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKCompletionBlocks.h"
#import "VKSubverse.h"
#import "VKSearchOptions.h"

//TODO: implement _default subverse
@interface VKClient (Submissions)


#pragma mark - Getting Links

/**
 Fetches the links from the front page of the current user.
 If no user is currently signed in, the default front page links will be fetched.
 
 @param searchOptions The search options to include for the order of the query response
 @param completion An optional block to be executed upon request completion. It takes three arguments: an array of VLinks, an NSNumber index, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)frontPageSubmissionsWithSearchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;


/**
 Fetches links aggregated from all the subverses on voat.
 
 @param searchOptions The search options to include for the order of the query response
 @param completion An optional block to be executed upon request completion. It takes three arguments: an array of VKLinks, an NSNumber index, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submissionsInAllSubverseWithSearchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Fetches links from the specified subverse.
 
 @param subverse The subverse from which to fetch links.
 @param searchOptions The search options to include for the order of the query response
 @param completion An optional block to be executed upon request completion. It takes three arguments: an array of VKLinks, an NSNumber index, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submissionsInSubverse:(VKSubverse *)subverse searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Fetches links from the specified subverse from the subverse identifier.
 
 @param subverseName The name of the subverse from which to fetch links.
 @param searchOptions The search options to include for the order of the query response
 @param completion An optional block to be executed upon request completion. It takes three arguments: an array of VKLinks, an NSNumber index, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submissionsInSubverseWithName:(NSString *)subverseName searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets a single submission by Id.
 
 @param submissionID The submission's id.
 @param completion An optional block to be executed upon request completion. It takes two arguments: the VKLink object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submissionWithID:(NSNumber *)submissionID completion:(VKObjectCompletionBlock)completion;


#pragma mark - Submitting

/**
 Submits a link post.
 
 @param title The title of the post.
 @param subverse The subverse in which to submit the post.
 @param URL The URL to submit.
 @param completion An optional block to be executed upon request completion. Its only argument is any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitLinkPostWithTitle:(NSString *)title subverse:(VKSubverse *)subverse URL:(NSURL *)URL completion:(VKObjectCompletionBlock)completion;

/**
 Submits a link post.
 
 @param title The title of the post.
 @param subverseName The name of the subverse in which to submit the post.
 @param URL The URL to submit.
 @param completion An optional block to be executed upon request completion. Its only argument is any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitLinkPostWithTitle:(NSString *)title subverseName:(NSString *)subverseName URL:(NSURL *)URL completion:(VKObjectCompletionBlock)completion;

/**
 Submits a self post.
 
 @param title The title of the post.
 @param subverse The subverse in which to submit the post.
 @param text The text to submit.
 @param completion An optional block to be executed upon request completion. Its only argument is any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitSelfPostWithTitle:(NSString *)title subverse:(VKSubverse *)subverse text:(NSString *)text completion:(VKObjectCompletionBlock)completion;

/**
 Submits a self post.
 
 @param title The title of the post.
 @param subverseName The name of the subverse in which to submit the post.
 @param text The text to submit.
 @param completion An optional block to be executed upon request completion. Its only argument is any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submitSelfPostWithTitle:(NSString *)title subverseName:(NSString *)subverseName text:(NSString *)text completion:(VKObjectCompletionBlock)completion;


@end
