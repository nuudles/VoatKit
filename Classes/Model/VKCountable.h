//
//  VKCountable.h
//  Pods
//
//  Created by Christopher Luu on 7/9/15.
//
//

#import <Mantle/Mantle.h>

@interface VKCountable : MTLModel <MTLJSONSerializing>

/**
 The total number of upvotes.
 */
@property (nonatomic, copy, readonly) NSNumber* upCount;

/**
 The total number of downvotes.
 */
@property (nonatomic, copy, readonly) NSNumber* downCount;

/**
 The total sum.
 */
@property (nonatomic, copy, readonly) NSNumber* sum;

@end
