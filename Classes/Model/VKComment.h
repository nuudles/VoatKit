//
//  VKComment.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKVotable.h"

@interface VKComment : VKVotable

/**
 The comment ID.
 */
@property (nonatomic, copy, readonly) NSNumber* commentID;

/**
 The date the comment was created.
 @warning creationDate from VKCreated will be null as the Voat API returns the key 'date' not 'creationDate'. The purpose of the implementation of VKCreationDate is for abstraction
 */
@property (nonatomic, strong) NSDate* date;

/**
 The parent comment ID.
 If null then comment is a root comment.
 */
@property (nonatomic, copy, readonly) NSNumber* parentID;

/**
 The submission ID that this comment belongs.
 */
@property (nonatomic, copy, readonly) NSNumber* submissionID;

/**
 The subveres that this comment belongs.
 */
@property (nonatomic, copy, readonly) NSString *subverse;

/**
 The user name who submitted the comment.
 */
@property (nonatomic, copy, readonly) NSString *username;

/**
 The child comment count.
 This is a count of direct decedents only.
 */
@property (nonatomic, copy, readonly) NSNumber* childcount;

/**
 Level of the comment. 0 is root.
 This value is relative to the parent comment. If you are loading mid-branch 0 will be returned for the starting position comment.
 */
@property (nonatomic, copy, readonly) NSNumber* level;

/**
 The raw content of this item.
 */
@property (nonatomic, copy, readonly) NSString* content;

/**
 The formatted content of this item.
 */
@property (nonatomic, copy, readonly) NSString* formattedContent;



@end
