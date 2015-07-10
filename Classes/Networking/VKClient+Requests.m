//
//  VKClient+Requests.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#define MON_Internal_UnusedStringify(macro_arg_string_literal) #macro_arg_string_literal

#define MONUnusedParameter(macro_arg_parameter) _Pragma(MON_Internal_UnusedStringify(unused(macro_arg_parameter)))

#import "VKClient+Requests.h"
#import "VKClient+Errors.h"
#import "VKClient+Authentication.h"
#import "VKObjectBuilder.h"

@implementation VKClient (Requests)

- (NSURLSessionDataTask *)basicPostTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKCompletionBlock)completion
{
    NSParameterAssert(path);
    
    return [self postPath:path parameters:parameters completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion(error);
            }
        });
    }];
}

- (NSURLSessionDataTask *)postWithResponse:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(path);
    
    NSMutableDictionary *taskParameters = [NSMutableDictionary dictionary];
    [taskParameters addEntriesFromDictionary:parameters];
    
    return [self postPath:path parameters:parameters completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!completion)
            {
                return;
            }
            
            if (responseObject)
            {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSDictionary *response = responseObject;
                    if ([responseObject isKindOfClass:[NSArray class]])
                    {
                        response = [responseObject lastObject];
                    }
                    
                    NSArray *objects = [self objectsFromListingResponse:response];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(objects, nil);
                    });
                });
            }
            else
            {
                completion(nil, error);
            }
        });
    }];
}

- (NSURLSessionDataTask *)getWithResponse:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKObjectCompletionBlock)completion {
    NSParameterAssert(path);
    
    NSMutableDictionary *taskParameters = [NSMutableDictionary dictionary];
    [taskParameters addEntriesFromDictionary:parameters];
    
    return [self getPath:path parameters:parameters completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!completion)
            {
                return;
            }
            
            if (responseObject)
            {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSDictionary *response = responseObject;
                    id object = [VKObjectBuilder objectFromJSON:response[@"data"]];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(object, nil);
                    });
                });
            }
            else
            {
                completion(nil, error);
            }
        });
    }];

}

- (NSURLSessionDataTask *)listingTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKListingCompletionBlock)completion
{
    NSParameterAssert(path);
    
    return [self fullListingWithPath:path parameters:parameters searchOptions:nil completion:^(id responseObject, NSError *error) {
        if (!completion)
        {
            return;
        }
        
        if (responseObject)
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSDictionary *response = responseObject;
                if ([responseObject isKindOfClass:[NSArray class]])
                {
                    response = [responseObject lastObject];
                }
                
                NSArray *objects = [self objectsFromListingResponse:response];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"PARAMETERS");
                    completion(objects, nil, nil);
                });
            });
        }
        else
        {
            completion(nil, nil, error);
        }
    }];
}

- (NSURLSessionDataTask *)listingTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters searchOptions:(VKSearchOptions *)searchOptions completion:(VKListingCompletionBlock)completion {
    NSParameterAssert(path);
    
    return [self fullListingWithPath:path parameters:parameters searchOptions:searchOptions completion:^(id responseObject, NSError *error) {
        if (!completion)
        {
            return;
        }
        
        if (responseObject)
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSDictionary *response = responseObject;
                if ([responseObject isKindOfClass:[NSArray class]])
                {
                    response = [responseObject lastObject];
                }
                
                NSArray *objects = [self objectsFromListingResponse:response];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(objects, searchOptions, nil);
                });
            });
        }
        else
        {
            completion(nil, nil, error);
        }
    }];
}

- (NSURLSessionDataTask *)fullListingWithPath:(NSString *)path parameters:(NSDictionary *)parameters searchOptions:(VKSearchOptions *)searchOptions completion:(VKObjectCompletionBlock)completion
{
    NSParameterAssert(path);
    
    NSMutableDictionary *taskParameters = [NSMutableDictionary dictionary];
    [taskParameters addEntriesFromDictionary:parameters];
    [taskParameters addEntriesFromDictionary:[searchOptions dictionaryValue]];
    
    return [self getPath:path parameters:taskParameters completion:^(NSHTTPURLResponse *response, id responseObject, NSError *error) {
        if (!completion)
        {
            return;
        }
        
        if (responseObject)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(responseObject, nil);
            });
        }
        else
        {
            completion(nil, error);
        }
    }];
}

- (NSURLSessionDataTask *)arrayTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKArrayCompletionBlock)completion {
    return [self arrayTaskWithPath:path parameters:parameters searchOptions:nil completion:completion];
}

- (NSURLSessionDataTask *)arrayTaskWithPath:(NSString *)path parameters:(NSDictionary *)parameters searchOptions:(VKSearchOptions *)searchOptions completion:(VKArrayCompletionBlock)completion {
    NSParameterAssert(path);
    
    return [self fullListingWithPath:path parameters:parameters searchOptions:searchOptions completion:^(id responseObject, NSError *error) {
        if (!completion)
        {
            return;
        }
        
        if (responseObject)
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSDictionary *response = responseObject;
                if ([responseObject isKindOfClass:[NSArray class]])
                {
                    response = [responseObject lastObject];
                }
                
                NSArray *objects = [self objectsFromListingResponse:response];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(objects, nil);
                });
            });
        }
        else
        {
            completion(nil, error);
        }
    }];

}

- (NSArray *)objectsFromListingResponse:(NSDictionary *)listingResponse
{
    NSParameterAssert(listingResponse);
    
    if(!([(NSDictionary *)listingResponse[@"data"] count] > 0)) {
        return nil;
    }
    
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[(NSArray*)listingResponse[@"data"] count]];
    
    for (NSDictionary *objectJSON in listingResponse[@"data"])
    {
        id object = [VKObjectBuilder objectFromJSON:objectJSON];
        
        if (object)
        {
            [objects addObject:object];
        }
    }
    
    return [objects copy];
}


#pragma mark - Request Helpers

- (NSString *)stringFromBoolean:(BOOL)boolean
{
    return boolean ? @"true" : @"false";
}

- (NSURLSessionDataTask *)getPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion
{
    return [self taskWithMethod:@"GET" path:path parameters:parameters completion:completion];
}

- (NSURLSessionDataTask *)postPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion
{
    if (![self isSignedIn])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion(nil, nil, [VKClient authenticationRequiredError]);
            }
        });
        
        return nil;
    }
    
    return [self taskWithMethod:@"POST" path:path parameters:parameters completion:completion];
}

- (NSURLSessionDataTask *)putPath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion
{
    if (![self isSignedIn])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion(nil, nil, [VKClient authenticationRequiredError]);
            }
        });
        
        return nil;
    }
    
    return [self taskWithMethod:@"PUT" path:path parameters:parameters completion:completion];
}

- (NSURLSessionDataTask *)deletePath:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion
{
    if (![self isSignedIn])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion(nil, nil, [VKClient authenticationRequiredError]);
            }
        });
        
        return nil;
    }
    
    return [self taskWithMethod:@"DELETE" path:path parameters:parameters completion:completion];
}

- (NSURLSessionDataTask *)taskWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters completion:(VKRequestCompletionBlock)completion
{
    NSParameterAssert(method);
    NSParameterAssert(path);
    
    
    NSString *URLString = [[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString];
    NSError *serializerError;
    NSURLRequest *request = [[self requestSerializer] requestWithMethod:method URLString:URLString parameters:parameters error:&serializerError];
    
    if (serializerError) {
        completion(nil, nil, serializerError);
        return nil;
    }
    
    NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSDictionary *headers = [((NSHTTPURLResponse *)response) allHeaderFields];
        MONUnusedParameter(headers);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion)
            {
                completion((NSHTTPURLResponse *)response, responseObject, error);
            }
        });
    }];
    
    [task resume];
    
    return task;
}


@end
