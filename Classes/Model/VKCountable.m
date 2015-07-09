//
//  VKCountable.m
//  Pods
//
//  Created by Christopher Luu on 7/9/15.
//
//

#import "VKCountable.h"

@implementation VKCountable

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"sum": @"sum",
             @"upCount": @"upCount",
             @"downCount": @"downCount",
             };
}

@end
