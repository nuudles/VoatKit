//
//  VKClient+Requests.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "AFHTTPSessionManager.h"
#import "VKSearchOptions.h"

typedef void(^VKRequestCompletionBlock)(NSHTTPURLResponse *response, id responseObject, NSError *error);

@interface VKClient (Requests)

/**
 Posts an object to the specified endpoint (path).
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param completion A block to execute at the end of the request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)basicPostTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKCompletionBlock)completion;

/**
 Makes an HTTP POST request expecting a response of a VK object
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param completion A block to execute at the end of the request.
 */
- (NSURLSessionDataTask *)postWithResponse:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKObjectCompletionBlock)completion;

/**
 Makes an HTTP POST request expecting a response of a VK object
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param completion A block to execute at the end of the request.
 */
- (NSURLSessionDataTask *)getWithResponse:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKObjectCompletionBlock)completion;

/**
 This method makes a request for a listing and converts the response into objects.
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param completion A block to execute at the end of the request.
 */
- (NSURLSessionDataTask *)listingTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKListingCompletionBlock)completion;

/**
 This method makes a request for a listing and converts the response into objects.
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param searchOptions The optional searchOptions object.
 @param completion A block to execute at the end of the request.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)listingTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion;

/**
 This method makes a request for a listing and converts the response into objects.
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param completion A block to execute at the end of the request.
 */
- (NSURLSessionDataTask *)arrayTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKArrayCompletionBlock)completion;

/**
 This method makes a request for a listing and converts the response into objects.
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param searchOptions The optional searchOptions object.
 @param completion A block to execute at the end of the request.
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)arrayTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters searchOptions:(VKSearchOptions *)searchOptions completion:(VKArrayCompletionBlock)completion;

/**
 This method makes a request for a listing and returns the full response.
 This is in contrast to listingTaskWithPath:parameters:pagination:completion: which returns
 a listing in its formatted state, with all JSON parsed.
 
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param searchOptions The optional searchOptions object.
 @param completion A block to execute at the end of the request.
 */
- (NSURLSessionDataTask *)fullListingWithPath:(NSString *)path parameters:(NSDictionary *)parameters searchOptions:(VKSearchOptions *)searchOptions completion:(VKObjectCompletionBlock)completion;

#pragma mark - Response Helpers

/**
 Extracts VK object from a listing response.
 @return The array of objects
 */
- (NSArray *)objectsFromListingResponse:(NSDictionary *)listingResponse;


#pragma mark - Request Helpers

- (NSURLSessionDataTask *)getPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion;
- (NSURLSessionDataTask *)postPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion;
- (NSURLSessionDataTask *)putPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion;
- (NSURLSessionDataTask *)deletePath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion;

/**
 A base request method for use throughout the library.
 
 @param method The method to use; one of 'GET', 'POST', 'PUT' or 'DELETE'.
 @param path The path to request.
 @param parameters The parameters to pass with the request.
 @param completion A block to execute at the end of the request.
 @return The newly created NSURLSessionDataTask.
 */
- (NSURLSessionDataTask *)taskWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion;


@end
