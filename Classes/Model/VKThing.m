//
//  VKThing.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/27/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKThing.h"
#import "VKCreated.h"
#import "VKMessage.h"

@implementation VKThing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             };
}

//TODO: REMAKE THIS DEPENDING ON API CHANGE
+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
    if (JSONDictionary[@"creationDate"] != nil || JSONDictionary[@"date"] != nil)
        return [VKCreated class];

    if (JSONDictionary[@"recipient"] != nil)
        return [VKMessage class];

    
    NSAssert(NO, @"No matching class for the JSON dictionary '%@'.", JSONDictionary);
    return self;
}

@end
