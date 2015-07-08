//
//  ViewController.m
//  VoatKitExample
//
//  Created by Amar Ramachandran on 7/1/15.
//  Copyright © 2015 AmarJayR. All rights reserved.
//

#import "ViewController.h"
#import "VoatKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[VKClient sharedClient] setApiKey:@"20xPvn9Q+VchKYoE9gfvWw=="];
    [[VKClient sharedClient] submissionsInSubverseWithName:@"_all" searchOptions:nil completion:^(NSArray *collection, VKSearchOptions *searchOptions, NSError *error) {
        NSLog(@"RECEIVED RESPONSE %@ WITH ERROR %@", collection, error);
        NSLog(@"DDATE: %@", [collection[0] creationDate]);

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
