//
//  VKObjectBuilder.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/27/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKObjectBuilder : NSObject

+ (instancetype)objectBuilder;

/**
 Takes a JSON dictionary from voats API response, figures out its class, then initializes and returns that object.
 */
+ (id)objectFromJSON:(NSDictionary *)JSON;

@end
