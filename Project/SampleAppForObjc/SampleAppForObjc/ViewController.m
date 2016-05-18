//
//  ViewController.m
//  SampleAppForObjc
//
//  Created by ao2-y on 2016/03/27.
//  Copyright © 2016年 ao2-y. All rights reserved.
//

#import "ViewController.h"
@import SwiftSampleFramework;

@interface ViewController ()
<SampleObjectDelegte>

@end

@implementation ViewController

- (void)loadFinishCallback:(NSDictionary *)result
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"%@", result);
    
}

- (void)loadErrorCallback:(NSError *)error
{
    NSLog(@"%@", error);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    SampleObject *so = [[SampleObject alloc]initWithDelegate:self];
    [so load];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
