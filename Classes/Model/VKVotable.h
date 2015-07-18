//
//  VKVotable.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKCreated.h"

typedef NS_ENUM(NSUInteger, VKVoteStatus) {
    VKVoteStatusNone,
    VKVoteStatusUpvoted,
    VKVoteStatusDownvoted
};

@interface VKVotable : VKCreated

/**
 The total number of upvotes.
 */
@property (nonatomic, copy, readonly) NSNumber* upvotes;

/**
 The total number of downvotes.
 */
@property (nonatomic, copy, readonly) NSNumber* downvotes;

/**
 The object's score.
 */
@property (nonatomic, copy, readonly) NSNumber* score;

/**
 The current user's vote status for this object.
 */
@property (nonatomic, assign, readonly) VKVoteStatus voteStatus;

/**
 Whether the current user has upvoted this object.
 */
- (BOOL)upvoted;

/**
 Whether the current user has downvoted this object.
 */
- (BOOL)downvoted;

/**
 Whether the current user has voted on this object.
 */
- (BOOL)voted;

@end
