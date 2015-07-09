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
@property (nonatomic, assign, readonly) NSNumber* upCount;

/**
 The total number of downvotes.
 */
@property (nonatomic, assign, readonly) NSNumber* downCount;

/**
 The total sum.
 */
@property (nonatomic, assign, readonly) NSNumber* sum;

@end
