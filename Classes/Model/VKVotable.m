//
//  VKVotable.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKVotable.h"
#import "VKSubmission.h"
#import "VKComment.h"

@interface VKVotable ()

@property (nonatomic, copy, readonly) NSNumber* score;

@end

@implementation VKVotable

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{
                               @"upvotes": @"upVotes",
                               @"downvotes": @"downVotes",
                               @"voteStatus": @"voteValue"
                               };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

- (NSNumber*)score
{
    return @([self.upvotes intValue] - [self.downvotes intValue]);
}

- (BOOL)upvoted
{
    return (self.voteStatus == VKVoteStatusUpvoted);
}

- (BOOL)downvoted
{
    return (self.voteStatus == VKVoteStatusDownvoted);
}

- (BOOL)voted
{
    return (self.voteStatus != VKVoteStatusNone);
}

//TODO: REMAKE THIS DEPENDING ON API CHANGE
+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
    if (JSONDictionary[@"childCount"] != nil && JSONDictionary[@"level"] != nil)
        return [VKComment class];
    
    if (JSONDictionary[@"commentCount"] != nil && JSONDictionary[@"title"] != nil)
        return [VKSubmission class];
    
    
    NSAssert(NO, @"No matching class for the JSON dictionary '%@'.", JSONDictionary);
    return self;
}

#pragma mark - MTLModel

+ (NSValueTransformer *)voteStatusJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id vote, BOOL *success, NSError *__autoreleasing *error) {
        if (!vote || vote == [NSNull null])
        {
            return @(VKVoteStatusNone);
        }
        else
        {
            BOOL likes = [vote boolValue];
            return likes ? @(VKVoteStatusUpvoted) : @(VKVoteStatusDownvoted);
        }
    }];
}

@end
