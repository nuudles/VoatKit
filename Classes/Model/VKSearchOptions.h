//
//  VKSearchOptions.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/27/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKSearchOptions : NSObject

typedef NS_ENUM(NSUInteger, VKUserContentSortingMethod) {
    VKUserContentSortingMethodNew = 1,
    VKUserContentSortingMethodTop,
    VKUserContentSortingMethodHot
};

typedef NS_ENUM(NSUInteger, VKSortSpanMethod) {
    VKTimeSortingMethodAllTime = 1,
    VKTimeSortingMethodThisHour,
    VKTimeSortingMethodToday,
    VKTimeSortingMethodThisWeek,
    VKTimeSortingMethodThisMonth,
    VKTimeSortingMethodThisQuarter,
    VKTimeSortingMethodThisYear,
};

extern NSString * VKStringFromSortSpanMethod(VKSortSpanMethod sortingMethod);
extern NSString * VKStringFromUserContentSortingMethod(VKUserContentSortingMethod sortingMethod);

/**
 The total number of things to return. This is 25 by default, and limited to 50.
 */
@property (nonatomic, assign) NSNumber* count;


/**
 The sorting method for user content. This affects the order in which user content is returned.
 
 */
@property (nonatomic, assign) VKUserContentSortingMethod sort;

/**
 The timeframe to sort by.
 */
@property (nonatomic, assign) VKSortSpanMethod span;

/**
 The index to start from
 */
@property (nonatomic, assign) NSNumber* index;

/**
 The page to start from
 @note: setting this will override the index property
 */
@property (nonatomic, assign) NSNumber* page;

/**
 Specifies the depth of comment tree to retrieve. Used only for comment queries.
 */
@property (nonatomic, assign) NSNumber* depth;


/**
 *  Turns the object into a query dictionary.
 *
 *  @return NSDictionary object to append to the end of the URL.
 */
-(NSDictionary *)dictionaryValue;

-(void)searchOptionsFromQueryString:(NSString*) queryString;

@end
