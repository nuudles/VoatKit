//
//  VKMessage.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKMessage.h"

@implementation VKMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{
                               @"messageID": @"id",
                               @"commentID": @"commentID",
                               @"submissionID": @"submissionID",
                               @"subverse": @"subverse",
                               @"recipient": @"recipient",
                               @"sender": @"sender",
                               @"subject": @"subject",
                               @"unread": @"unread",
                               @"type": @"type",
                               @"typeName": @"typeName",
                               @"content": @"content"
                               };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - MTLModel

+ (NSValueTransformer *)typeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber* type, BOOL *success, NSError *__autoreleasing *error) {
        
        return @((VKMessageType)[type intValue]);
        /*
        if([type  isEqual: @1])
            return @(VKMessageTypeInbox);
        if([type isEqual:@2])
            return @(VKMessageTypeSent);
        if([type isEqual:@4])
            return @(VKMessageTypeComment);
        if([type isEqual:@8])
            return @(VKMessageTypeSubmission);
        if([type isEqual:@16])
            return @(VKMessageTypeMention);
        if([type isEqual:@31])
            return @(VKMessageTypeAll);*/
        
        return nil;
    }];
}

@end
