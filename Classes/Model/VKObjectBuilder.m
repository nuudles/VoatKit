//
//  VKObjectBuilder.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/27/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKObjectBuilder.h"
#import "VKThing.h"
#import "VKUser.h"
#import <Mantle/Mantle.h>

@implementation VKObjectBuilder

+ (instancetype)objectBuilder
{
    static VKObjectBuilder *objectBuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objectBuilder = [[VKObjectBuilder alloc] init];
    });
    
    return objectBuilder;
}

+ (id)objectFromJSON:(NSDictionary *)JSON
{
    NSError *error = nil;

    if (JSON[@"bio"]) {
        //Object type is VKUser
        id model = [MTLJSONAdapter modelOfClass:[VKUser class] fromJSONDictionary:JSON[@"data"] error:&error];
        
        if (!error)
        {
            return model;
        }
        else
        {
            NSLog(@"Failed to build model: %@", error);
            return nil;
        }
    }
    
    id model = [MTLJSONAdapter modelOfClass:[VKThing class] fromJSONDictionary:JSON error:&error];
    
    if (!error)
    {
        return model;
    }
    else
    {
        NSLog(@"Failed to build model: %@", error);
        return nil;
    }

}

@end
