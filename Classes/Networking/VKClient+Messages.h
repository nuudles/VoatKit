//
//  VKClient+Messages.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient.h"
#import "VKMessage.h"

typedef NS_ENUM(NSUInteger, VKMessageState) {
    VKMessageStateUnread = 1,
    VKMessageStateRead = 2,
    VKMessageStateAll = 3
};

@interface VKClient (Messages)

#pragma mark - Fetching Messages

/**
 Returns the current user's messages from the current user's inbox.
 
 @param state The type/state of the objects to receive
 @param completion An optional block to be executed upon request completion. It takes two arguments: an array of VKMessages and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)messagesInInboxWithState:(VKMessageState)state completion:(VKListingCompletionBlock)completion;

/**
 Returns the current user's unread messages from the current user's inbox.
 
 @param state The type/state of the objects to receive
 @param completion An optional block to be executed upon request completion. It takes two arguments: an array of VKMessages and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)unreadMessagesWithType:(VKMessageType)type completion:(VKListingCompletionBlock)completion;

/**
 Returns the current user's sent messages.
 
 @param state The type/state of the objects to receive
 @param completion An optional block to be executed upon request completion. It takes two arguments: an array of VKMessages and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)sentMessages:(VKListingCompletionBlock)completion;

/**
 Returns the current user's messages with the enum bit mask
 
 @param state The type/state of the objects to receive
 @param completion An optional block to be executed upon request completion. It takes two arguments: an array of VKMessages and any error that occurred.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)messagesWithType:(VKMessageType)type withState:(VKMessageState)state completion:(VKListingCompletionBlock)completion;

#pragma mark - Sending Messages
/**
 Sends a message to another voat user.
 
 @param message The message object to send.
 @param subject The subject of the message.
 @param recipient The username of the message's recipient.
 @param completion The block to be executed upon completion of the request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)sendMessage:(NSString *)message subject:(NSString *)subject recipient:(NSString *)recipient completion:(VKCompletionBlock)completion;

/**
 Replies to an existing message.
 
 @param userMessage The message object to reply to.
 @param message The message object to send.
 @param completion The block to be executed upon completion of the request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)replyToMessage:(VKMessage *)userMessage message:(NSString*)message completion:(VKCompletionBlock)completion;

/**
 Replies to an existing message based on message ID.
 
 @param messageIdentifier The messageID to respond to.
 @param message The message object to send.
 @param completion The block to be executed upon completion of the request.
 @note Authentication required
 @return The NSURLSessionDataTask for the request.
 */
- (NSURLSessionDataTask *)replyToMessageWithIdentifier:(NSNumber *)messageIdentifier message:(NSString*)message completion:(VKCompletionBlock)completion;

@end
