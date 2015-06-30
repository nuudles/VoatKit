//
//  VKSubverse.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKCreated.h"

@interface VKSubverse : VKCreated

// TODO: replace these once the api documentation comes out

/**
 The subverse name
 */
@property (nonatomic, copy, readonly) NSString* name;

/**
 The subverse title.
 */
@property (nonatomic, copy, readonly) NSString* title;

/**
 The subverse description.
 */
@property (nonatomic, copy, readonly) NSString* subverseDescription;

/**
 The subscriber count.
 */
@property (nonatomic, assign, readonly) NSUInteger subscriberCount;

/**
 The submission title.
 */
@property (nonatomic, copy, readonly) NSString* sideBar;

/**
 The submission title.
 */
@property (nonatomic, assign, readonly) BOOL ratedAdult;


@end
