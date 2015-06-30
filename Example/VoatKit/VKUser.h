//
//  VKUser.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "Mantle.h"

@interface VKUser : MTLModel <MTLJSONSerializing>

/**
 The user name of the user when addressed by name
 */
@property (nonatomic, strong, readonly) NSString *username;

/**
 Short bio of user
 */
@property (nonatomic, strong, readonly) NSString *bio;

/**
 Path to profile picture
 */
@property (nonatomic, strong, readonly) NSString *profilePicture;

/**
 The badges the user has accumulated
 */
@property (nonatomic, strong, readonly) NSArray *badges;

@end
