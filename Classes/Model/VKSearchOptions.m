//
//  NSObject+VKSearchOptions.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/27/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKSearchOptions.h"
#import <objc/runtime.h>


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
    
    if(self.span)
        [keyValuePairs setObject:@(self.span-1) forKey:@"span"];
    if(self.sort)
        [keyValuePairs setObject:@(self.sort-1) forKey:@"sort"];
    if(self.count)
        [keyValuePairs setObject:self.count forKey:@"count"];
    if(self.index)
        [keyValuePairs setObject:self.index forKey:@"index"];
    if(self.page)
        [keyValuePairs setObject:self.page forKey:@"page"];
    if(self.search)
        [keyValuePairs setObject:self.page forKey:@"search"];
    if(self.depth != NULL)
        [keyValuePairs setObject:self.depth forKey:@"depth"];
    
    return keyValuePairs;
}


-(void)searchOptionsFromQueryString:(NSString*) queryString {
    //span=1&sort=2
    NSArray* keyValuePairs = [queryString componentsSeparatedByString:@"&"];
    NSMutableDictionary* dictionaryPairs = [[NSMutableDictionary alloc] initWithCapacity:[keyValuePairs count]];
    
    for (NSString* keyValue in keyValuePairs) {
        NSString* key = [keyValue componentsSeparatedByString:@"="][0];
        if (![self respondsToSelector:NSSelectorFromString(key)]) {
            continue;
        }
        
        NSString* value = [keyValue componentsSeparatedByString:@"="][1];
        
        NSLog(@"CLASS: %@", [[self valueForKey:key] class]);
        if ([[[self valueForKey:key] class] isSubclassOfClass:[NSNumber class]]) {
            NSLog(@"IS SUBCLASS: %@", key);
            [self setValue:[NSNumber numberWithInteger:[value integerValue]] forKey:key];
            continue;
        }
        
        [self setValue:value forKey:key];
        
    }
}



@end
