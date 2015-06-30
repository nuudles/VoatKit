//
//  VKClient+Messages.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Messages.h"
#import "VKClient+Requests.h"

NSString * VKStringFromMessageType(VKMessageType message)
{
    //TODO: voat.co does not support more than one type right now contradictory to the docs. An issue has been submitted to http://fakevout.azurewebsites.net/v/Api/comments/4071
    NSMutableString* resultString = [[NSMutableString alloc] init];
    if ((message & VKMessageTypeInbox) != 0)
        [resultString appendString:@"Inbox"];
    if ((message & VKMessageTypeSent) != 0)
        [resultString appendString:@"Sent"];
    if ((message & VKMessageTypeInbox) != 0)
        [resultString appendString:@"Comment"];
    if ((message & VKMessageTypeInbox) != 0)
        [resultString appendString:@"Submission"];
    if ((message & VKMessageTypeInbox) != 0)
        [resultString appendString:@"Mention"];
    
    return resultString;
}

@implementation VKClient (Messages)

#pragma mark - Fetching Messages

- (NSURLSessionDataTask *)messagesInInboxWithState:(VKMessageState)state completion:(VKListingCompletionBlock)completion {
    return [self messagesWithType:VKMessageTypeInbox withState:state completion:completion];
}

- (NSURLSessionDataTask *)unreadMessagesWithType:(VKMessageType)type completion:(VKListingCompletionBlock)completion {
    return [self messagesWithType:type withState:VKMessageStateUnread completion:completion];
}

- (NSURLSessionDataTask *)sentMessages:(VKListingCompletionBlock)completion {
    return [self messagesWithType:VKMessageTypeSent withState:0 completion:nil];
}

- (NSURLSessionDataTask *)messagesWithType:(VKMessageType)type withState:(VKMessageState)state completion:(VKListingCompletionBlock)completion {
    return [self listingTaskWithPath:[NSString stringWithFormat:@"api/v1/u/messages/%lu/%lu", (unsigned long)type, (unsigned long)state] parameters:nil completion:completion];
}

#pragma mark - Sending Messages

- (NSURLSessionDataTask *)sendMessage:(NSString *)message subject:(NSString *)subject recipient:(NSString *)recipient completion:(VKCompletionBlock)completion {
    NSParameterAssert(message);
    NSParameterAssert(subject);
    NSParameterAssert(recipient);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:3];
    [parameters setObject:message forKey:@"message"];
    [parameters setObject:subject forKey:@"subject"];
    [parameters setObject:recipient forKey:@"recipient"];
    
    return [self basicPostTaskWithPath:@"api/v1/u/messages" parameters:parameters completion:completion];
}

- (NSURLSessionDataTask *)replyToMessage:(VKMessage *)userMessage message:(NSString*)message completion:(VKCompletionBlock)completion {
    return [self replyToMessageWithIdentifier:userMessage.messageID message:message completion:completion];
}

- (NSURLSessionDataTask *)replyToMessageWithIdentifier:(NSNumber *)messageIdentifier message:(NSString*)message completion:(VKCompletionBlock)completion {
    NSParameterAssert(message);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:1];
    [parameters setObject:message forKey:@"value"];
    
    return [self basicPostTaskWithPath:[NSString stringWithFormat:@"api/v1/u/messages/reply/%@", messageIdentifier] parameters:parameters completion:completion];
}
@end
