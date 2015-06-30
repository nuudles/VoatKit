//
//  ViewController.m
//  VoatKit
//
//  Created by Amar Ramachandran on 6/26/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "ViewController.h"
#import "VoatKit.h"
#import "Mantle.h"
#import "Lockbox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *path = [[NSBundle mainBundle] pathForResource: @"keys" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];

    [[VKClient sharedClient] setApiKey:[dict objectForKey:@"apiKey"]];
    [[VKClient sharedClient] setUserAgent:@"VoatKitDev"];
    
    
    if ([Lockbox stringForKey:@"username"] != NULL) {
        //Existing key
        NSLog(@"USERNAME: %@", [Lockbox stringForKey:@"username"]);
    } else {
        //Generate new key
        NSLog(@"Password:");
    }
    
    VKSearchOptions* options = [[VKSearchOptions alloc] init];
    options.sortMethod = VKUserContentSortingMethodTop;
    
    [[VKClient sharedClient] frontPageSubmissionsWithSearchOptions:options completion:^(NSArray *collection, VKSearchOptions *searchOptions, NSError *error) {
        NSLog(@"FRONTPAGE: %@", collection);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
