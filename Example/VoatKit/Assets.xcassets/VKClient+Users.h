//
//  VKClient+User.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKUser.h"

@interface VKClient (Users)

/**
 Gets the current user.
 
 @param completion The block to be executed upon completion of the request.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)currentUserWithCompletion:(VKObjectCompletionBlock)completion;

//TODO: needs to be implemented once the docs are updated
/**
 Gets saved items for the current user
 
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKLinks, a VKSearchOptions object, and any error that occurred.
 @note Authentication required
 @warning: not implemented
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)savedItemsForCurrentUser:(VKListingCompletionBlock)completion;

/**
 Gets information for a a specific user.
 This method is useful when you already have an VKUser object, but need to get up-to-date karma totals and post history.
 
 @param user The user object to fetch.
 @param completion The block to be executed upon completion of the request. It takes two arguments: the response object (an VKUser) and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)user:(VKUser *)user completion:(VKObjectCompletionBlock)completion;

/**
 Gets information for a specific user.
 
 @param username The username to gather information for.
 @param completion The block to be executed upon completion of the request. It takes two arguments: the response object (an VKUser) and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)userWithUsername:(NSString *)username completion:(VKObjectCompletionBlock)completion;

#pragma mark - User Content

/**
 Gets comments submitted by a user.
 
 @param user The user for which to get comments.
 @param searchOptions An optional searchOptions object.
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKLinks, a VKSearchOptions object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)commentsByUser:(VKUser *)user searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets comments submitted by a user.
 
 @param username The username of the user for which to get comments.
 @param searchOptions An optional searchOptions object.
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKLinks, a VKSearchOptions object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)commentsByUserWithUsername:(NSString *)username searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets submissions by a user.
 
 @param user The user whose submissions should be fetched.
 @param searchOptions An optional searchOptions object.
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKLinks, a VKSearchOptions object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submissionsByUser:(VKUser *)user searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets submissions by a user.
 
 @param username The username of the user whose submissions should be fetched.
 @param searchOptions An optional searchOptions object.
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKLinks, a VKSearchOptions object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)submissionsByUserWithUsername:(NSString *)username searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets a users subscriptions.
 
 @param user The user whose submissions should be fetched.
 @param searchOptions An optional searchOptions object.
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKSubverse, a VKSearchOptions object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)subscriptionsForUser:(VKUser *)user searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 Gets a users subscriptions.
 
 @param username The username of the user whose submissions should be fetched.
 @param searchOptions An optional searchOptions object.
 @param completion The block to be executed upon completion of the request. It takes three arguments: an array of VKSubverse, a VKSearchOptions object, and any error that occurred.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)subscriptionsForUserWithUsername:(NSString *)username searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;


@end
