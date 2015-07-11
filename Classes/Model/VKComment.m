//
//  VKComment.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKComment.h"

@implementation VKComment
@dynamic creationDate;

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{@"commentID":@"id",
                               @"parentID":@"parentID",
                               @"submissionID":@"submissionID",
                               @"subverse":@"subverse",
                               @"username":@"userName",
                               @"childcount":@"childCount",
                               @"level":@"level",
                               @"content":@"content",
                               @"date":@"date",
                               @"formattedContent":@"formattedContent"
                               };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - MTLModel

+ (NSValueTransformer *)dateJSONTransformer {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        
        return [dateFormatter dateFromString:dateString];
    }];
    
    return nil;
}

@end
