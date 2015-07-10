//
//  VKCreated.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKCreated.h"
#import "VKSubverse.h"
#import "VKVotable.h"

@implementation VKCreated

//TODO: IMPLEMENT CREATION DATE FOR SUBVERSE INFO
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"creationDate": @"date",
             };
}


//TODO: REMAKE THIS DEPENDING ON API CHANGE
+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
    if (JSONDictionary[@"name"] != nil && JSONDictionary[@"subscriberCount"] != nil)
        return [VKSubverse class];
    
    
    if (JSONDictionary[@"upVotes"] != nil && JSONDictionary[@"downVotes"] != nil)
        return [VKVotable class];
    
    
    NSAssert(NO, @"No matching class for the JSON dictionary '%@'.", JSONDictionary);
    return self;
}

#pragma mark - MTLModel

+ (NSValueTransformer *)creationDateJSONTransformer {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [dateFormatter dateFromString:dateString];
    }];
    
    return nil;
}

@end
