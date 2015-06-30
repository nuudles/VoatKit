
//
//  VKUser.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKUser.h"

@implementation VKUser


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"username": @"userName",
             @"bio": @"bio",
             @"profilePicture": @"profilePicture",
             @"badges": @"badges"
             };
}


@end
