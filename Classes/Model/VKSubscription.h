//
//  VKSubscription.h
//  VoatKit
//
//  Created by Christopher Luu on 7/13/15.
//
//

#import <Mantle/Mantle.h>

typedef NS_ENUM(NSUInteger, VKSubscriptionType) {
    VKSubscriptionTypeSubverse = 1,
    VKSubscriptionTypeSet
};

@interface VKSubscription : MTLModel <MTLJSONSerializing>

/**
 Specifies the type of subscription
 */
@property (nonatomic, readonly) VKSubscriptionType type;

/**
 The friendly name of the subscription
 */
@property (nonatomic, strong, readonly) NSString *typeName;

/**
 Specifies the name of the subscription item
 */
@property (nonatomic, strong, readonly) NSString *name;

@end
