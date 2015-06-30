//
//  NSObject+VKSearchOptions.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/27/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKSearchOptions.h"



NSString * VKStringFromTimeSortingMethod(VKSortSpanMethod sortingMethod)
{
    switch (sortingMethod)
    {
        case VKTimeSortingMethodThisHour:
            return @"hour";
        case VKTimeSortingMethodToday:
            return @"day";
        case VKTimeSortingMethodThisWeek:
            return @"week";
        case VKTimeSortingMethodThisMonth:
            return @"month";
        case VKTimeSortingMethodThisYear:
            return @"year";
        case VKTimeSortingMethodAllTime:
            return @"all";
        default:
            return nil;
    }
}

NSString * VKStringFromUserContentSortingMethod(VKUserContentSortingMethod sortingMethod)
{
    switch (sortingMethod)
    {
        case VKUserContentSortingMethodNew:
            return @"new";
        case VKUserContentSortingMethodHot:
            return @"hot";
        case VKUserContentSortingMethodTop:
            return @"top";
        default:
            return nil;
    }
}


@implementation VKSearchOptions

- (void)setCount:(NSNumber*)count
{
    _count = @(MIN(50, [count intValue]));
}

-(NSDictionary *)dictionaryValue {
    NSMutableDictionary* keyValuePairs = [[NSMutableDictionary alloc] init];
    
    if(self.spanMethod)
        [keyValuePairs setObject:@(self.spanMethod-1) forKey:@"span"];
    if(self.sortMethod)
        [keyValuePairs setObject:@(self.sortMethod-1) forKey:@"sort"];
    if(self.count)
        [keyValuePairs setObject:self.count forKey:@"count"];
    if(self.index)
        [keyValuePairs setObject:self.index forKey:@"index"];
    if(self.page)
        [keyValuePairs setObject:self.page forKey:@"page"];
    if(self.commentDepth != NULL)
        [keyValuePairs setObject:self.commentDepth forKey:@"depth"];
    
    return keyValuePairs;
}


@end
