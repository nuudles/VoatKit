//
//  VKSubverse.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKSubverse.h"

@implementation VKSubverse

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{
                               @"name": @"name",
                               @"title": @"title",
                               @"subverseDescription":@"description",
                               @"subscriberCount": @"subscriberCount",
                               @"sideBar": @"sidebar",
                               @"ratedAdult": @"ratedAdult"
                               };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}


@end
