//
//  VKCreated.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "VKThing.h"

@interface VKCreated : VKThing

/**
 Date the item was submitted/created.
 @note: Do not use this property for comments as it will be null
 */
@property (nonatomic, strong) NSDate *creationDate;

@end
