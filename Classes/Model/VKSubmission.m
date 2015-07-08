//
//  VKSubmission.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKSubmission.h"

@implementation VKSubmission

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{
                               @"submissionID": @"id",
                               @"commentCount": @"commentCount",
                               @"userName": @"userName",
                               @"subverse": @"subverse",
                               @"thumbnail": @"thumbnail",
                               @"title": @"title",
                               @"postType": @"type",
                               @"url": @"url",
                               @"content": @"content"
                               };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - MTLModel

+ (NSValueTransformer *)postTypeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber *typeString, BOOL *success, NSError *__autoreleasing *error) {
        if([typeString  isEqual: @1])
            return @(VKLinkTypeDiscussion);
        else
            return @(VKLinkTypeLink);
        
        return nil;
    }];
    
    return nil;
}


@end
