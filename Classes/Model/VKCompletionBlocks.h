//
//  VKCompletionBlocks.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKSearchOptions.h"

/**
 A standard completion block, which either fails or doesn't.
 */
typedef void (^VKCompletionBlock)(NSError *error);

/**
 A completion block for boolean responses, such as determining whether a user is required to complete a CAPTCHA or not.
 */
typedef void (^VKBooleanCompletionBlock)(BOOL result, NSError *error);

/**
 An object completion block, when retrieving resources that return a single object.
 */
typedef void (^VKObjectCompletionBlock)(id object, NSError *error);

/**
 An array completion block, when retrieving collections of objects.
 */
typedef void (^VKArrayCompletionBlock)(NSArray *collection, NSError *error);

/**
 A listing completion block, when retrieving collections which implement search options.
 @note: This is not implemented because Voat does not yet return a Search Options object with results, for now searchOptions will return nil.
 */
typedef void (^VKListingCompletionBlock)(NSArray *collection, VKSearchOptions *searchOptions, NSError *error);
