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
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    SampleObject *so = [[SampleObject alloc]initWithDelegate:self];
//    [so load];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
    
    
}

- (void)tap {
//    [self ephemeralSessionConfiguration];
//    [self ephemeralSessionConfiguration2];
    [self defaultSessionConfiguration];
//    [self defaultSessionConfiguration2];
//    [self sharedSession];
}

- (void) ephemeralSessionConfiguration {
    // ephemeralSessionConfiguration
    // memory 20mb -> 25.9mb
    // speed : 2.225132
    // network tcp 4つ？
    
    int stime = [[NSDate date] timeIntervalSince1970];
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    for (int i=0; i<200; i++) {
        [[session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/jp/rss/topgrossingapplications/limit=10/json"]
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    NSLog(@"no:%d - %lubytes - %f", i, data.length, [[NSDate date] timeIntervalSince1970] - stime);
                }] resume];
    }
}

- (void) ephemeralSessionConfiguration2 {
    // ephemeralSessionConfiguration
    // memory 20mb -> 47.0mb
    // speed : 5.965159
    // network tcp大量
    
    int stime = [[NSDate date] timeIntervalSince1970];
    for (int i=0; i<200; i++) {
        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
        [[session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/jp/rss/topgrossingapplications/limit=10/json"]
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    NSLog(@"no:%d - %lubytes - %f", i, data.length, [[NSDate date] timeIntervalSince1970] - stime);
                }] resume];
    }
}


- (void)defaultSessionConfiguration {
    // defaultSessionConfiguration
    // memory 19.5mb -> 34.5mb
    // speed : 2.537613
    // network tcp 4つ？
    
    int stime = [[NSDate date] timeIntervalSince1970];
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    for (int i=0; i<200; i++) {
        [[session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/jp/rss/topgrossingapplications/limit=10/json"]
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    NSLog(@"no:%d - %lubytes - %f", i, data.length, [[NSDate date] timeIntervalSince1970] - stime);
                }] resume];
    }
}

- (void)defaultSessionConfiguration2 {
    // defaultSessionConfiguration
    // memory 15.9mb -> 52.6mb
    // speed : 4.078292
    // network tcp大量
    
    int stime = [[NSDate date] timeIntervalSince1970];
    for (int i=0; i<200; i++) {
        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
        [[session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/jp/rss/topgrossingapplications/limit=10/json"]
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    NSLog(@"no:%d - %lubytes - %f", i, data.length, [[NSDate date] timeIntervalSince1970] - stime);
                }] resume];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
