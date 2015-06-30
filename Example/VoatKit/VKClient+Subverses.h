//
//  VKClient+Subverses.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKSearchOptions.h"
#import "VKSubverse.h"

@interface VKClient (Subverses)

#pragma mark - Getting Subverses

/**
 Gets a subverse with a given name.
 
 @param subverseName The name of the subverse to get.
 @param completion An optional block to be executed on the completion of a request. Its object parameter is an VKSubverse object.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)subverseWithName:(NSString *)subverseName completion:(VKObjectCompletionBlock)completion;

/**
 Blocks the current user from a subverse.
 
 @param subverse The subverse from which to block.
 @param completion An optional block to be executed on the completion of a request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)blockSubverseFromAll:(VKSubverse *)subverse completion:(VKCompletionBlock)completion;

/**
 Unblocks the current user from a subverse.
 
 @param subverse The subverse from which to unblock.
 @param completion An optional block to be executed on the completion of a request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)unblockSubverseFromAll:(VKSubverse *)subverse completion:(VKCompletionBlock)completion;

/**
 Blocks the current user from a subverse based on the subverse name.
 
 @param subverseName The name subverse from which to block.
 @param completion An optional block to be executed on the completion of a request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)blockSubverseFromAllWithName:(NSString *)subverseName completion:(VKCompletionBlock)completion;

/**
 Unblocks the current user from a subverse.
 
 @param subverse The subverse from which to unblock.
 @param completion An optional block to be executed on the completion of a request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)unblockSubverseFromAllWithName:(NSString *)subverseName completion:(VKCompletionBlock)completion;

@end
