//
//  VKSubscription.m
//  VoatKit
//
//  Created by Christopher Luu on 7/13/15.
//
//

#import "VKSubscription.h"

@implementation VKSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"type": @"type",
             @"typeName": @"typeName",
             @"name": @"name"
             };
}

@end
