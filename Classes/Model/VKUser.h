//
//  VKUser.h
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "VKCountable.h"

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

/**
 The date that the user registered
 */
@property (nonatomic, strong, readonly) NSDate *registrationDate;

/**
 The point count for the users' comments.
 */
@property (nonatomic, strong, readonly) VKCountable *commentPoints;

/**
 The point count for the users' submissions.
 */
@property (nonatomic, strong, readonly) VKCountable *submissionPoints;

/**
 The count for the users' comment voting.
 */
@property (nonatomic, strong, readonly) VKCountable *commentVoting;

/**
 The count for the users' submission voting.
 */
@property (nonatomic, strong, readonly) VKCountable *submissionVoting;

@end
