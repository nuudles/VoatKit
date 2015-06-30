//
//  VKClient+Authentication.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "VKClient+Authentication.h"
#import "VKClient+Users.h"

@interface VKClient ()

@end

@implementation VKClient (Authentication)

- (NSURLSessionDataTask *)signInWithUsername:(NSString *)username password:(NSString *)password completion:(VKCompletionBlock)completion {
    NSParameterAssert(username);
    NSParameterAssert(password);
    
    NSDictionary *parameters = @{@"username": username, @"password": password, @"grant_type": @"password"};
    
    NSURL *baseURL = [[self class] APIBaseHTTPSURL];
    NSString *URLString = [[NSURL URLWithString:@"api/token" relativeToURL:baseURL] absoluteString];
    
    NSError *serializerError;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:&serializerError];
    [request setValue:[self apiKey] forHTTPHeaderField:@"Voat-ApiKey"];
    
    if (serializerError) {
        completion(serializerError);
        return nil;
    }
    
    [self signOut];
    
    __weak __typeof(self)weakSelf = self;
    NSURLSessionDataTask *authenticationTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error)
        {
            if (completion)
            {
                completion(error);
            }
        }
        else
        {
            weakSelf.accessToken = responseObject[@"access_token"];
            weakSelf.tokenType = responseObject[@"token_type"];
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
            NSDate* newDate = [[NSDate date] dateByAddingTimeInterval:[responseObject[@"expires_in"] doubleValue]];
            weakSelf.expirationDate = newDate;
            weakSelf.password = password;
            
            [weakSelf userWithUsername:username completion:^(id object, NSError *error) {
                weakSelf.currentUser = object;
                NSLog(@"CURRENT USERNAME: %@", [object username]);
                if (completion)
                {
                    completion(nil);
                }
            }];

        }
    }];
    
    [authenticationTask resume];
    
    return authenticationTask;
}

- (NSURLSessionDataTask *)signInWithUsername:(NSString *)username password:(NSString *)password token:(NSString*)token tokenType:(NSString*)tokenType expirationDate:(NSDate*)expirationDate completion:(VKCompletionBlock)completion {
    self.accessToken = token;
    self.tokenType = tokenType;
    self.password = password;
    self.expirationDate = expirationDate;
    
    return [self userWithUsername:username completion:^(id object, NSError *error) {
        self.currentUser = object;
    }];
}

- (NSURLSessionDataTask *)updateToken:(VKCompletionBlock)completion {
    if (!self.currentUser) {
        completion(nil);
        return nil;
    }
    
    self.expirationDate = nil;
    self.tokenType = nil;
    self.accessToken = nil;
    
    return [self signInWithUsername:self.currentUser.username password:self.password completion:completion];
}


- (BOOL)isValidToken {
    if(![self accessToken])
        return false;
    
    if ([[self expirationDate] timeIntervalSince1970]-600 < [[NSDate date] timeIntervalSince1970])
        return false;
    
    return true;
}

- (BOOL)isSignedIn {
    return true;
}

- (void)signOut {
    self.currentUser = nil;
    self.expirationDate = nil;
    self.tokenType = nil;
    self.accessToken = nil;
}

@end
