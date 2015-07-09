
//
//  VKUser.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKUser.h"
#import "VKCountable.h"

@implementation VKUser


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"username": @"userName",
             @"bio": @"bio",
             @"profilePicture": @"profilePicture",
             @"badges": @"badges",
             @"registrationDate": @"registrationDate",
             @"commentPoints": @"commentPoints",
             @"submissionPoints": @"submissionPoints",
             @"commentVoting": @"commentVoting",
             @"submissionVoting": @"submissionVoting"
             };
}


#pragma mark - MTLModel

+ (NSValueTransformer *)commentPointsJSONTransformer {
    return [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:VKCountable.class];
}

+ (NSValueTransformer *)submissionPointsJSONTransformer {
    return [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:VKCountable.class];
}

+ (NSValueTransformer *)commentVotingJSONTransformer {
    return [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:VKCountable.class];
}

+ (NSValueTransformer *)submissionVotingJSONTransformer {
    return [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:VKCountable.class];
}

+ (NSValueTransformer *)registrationDateJSONTransformer {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];

    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [dateFormatter dateFromString:dateString];
    }];

    return nil;
}

@end
