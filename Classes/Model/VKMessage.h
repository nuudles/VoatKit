//
//  VKMessage.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKThing.h"

typedef NS_ENUM(NSUInteger, VKMessageType) {
    VKMessageTypeInbox = (1 << 0),
    VKMessageTypeSent = (1 << 1),
    VKMessageTypeComment = (1 << 2),
    VKMessageTypeSubmission = (1 << 3),
    VKMessageTypeMention = (1 << 4)
};

@interface VKMessage : VKThing

/**
 The ID of the message
 */
@property (nonatomic, assign, readonly) NSNumber* messageID;

/**
 The CommentID that this message is related.
 */
@property (nonatomic, assign, readonly) NSNumber* commentID;

/**
 The SubmissionID that this message is related.
 */
@property (nonatomic, assign, readonly) NSNumber* submissionID;

/**
 The subverse that this message is related.
 */
@property (nonatomic, copy, readonly) NSString* subverse;

/**
 The entity that message was sent to.
 */
@property (nonatomic, copy, readonly) NSString* recipient;

/**
 The entity that sent message.
 */
@property (nonatomic, copy, readonly) NSString* sender;

/**
 The Subject of the message.
 */
@property (nonatomic, copy, readonly) NSString* subject;

/**
 A state of the message.
 */
@property (nonatomic, assign, readonly, getter = isRead) BOOL unread;

/**
 The type of message.
 */
@property (nonatomic, assign, readonly) VKMessageType type;

/**
 The text description of the type of message this is.
 */
@property (nonatomic, copy, readonly) NSString* typeName;

/**
 The raw content of this item.
 */
@property (nonatomic, copy, readonly) NSString* content;





@end
