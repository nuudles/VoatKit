//
//  VKSubmission.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKVotable.h"

typedef NS_ENUM(NSUInteger, VKLinkType) {
    VKLinkTypeLink,
    VKLinkTypeDiscussion,
};

@interface VKSubmission : VKVotable

/**
 The submission ID.
 */
@property (nonatomic, copy, readonly) NSNumber* submissionID;

/**
 The number of comments submission current contains.
 */
@property (nonatomic, copy, readonly) NSNumber* commentCount;

/**
 The user name who submitted the post.
 */
@property (nonatomic, copy, readonly) NSString* userName;

/**
 The subverse to which this submission belongs.
 */
@property (nonatomic, copy, readonly) NSString* subverse;

/**
 The thumbnail for submission.
 */
@property (nonatomic, copy, readonly) NSString* thumbnail;

/**
 The submission title.
 */
@property (nonatomic, copy, readonly) NSString* title;

/**
 The type of submission.
 Values: 1 for Self Posts, 2 for Link Posts
 */
@property (nonatomic, assign, readonly) VKLinkType postType;

/**
 The url for the submission if present.
 */
@property (nonatomic, copy, readonly) NSString* url;

/**
 The raw content of this item.
 */
@property (nonatomic, copy, readonly) NSString* content;

/**
 The formatted (MarkDown, Voat Content Processor) content of this item. This content is typically formatted into HTML output.
 */
@property (nonatomic, copy, readonly) NSString* formattedContent;

@end
