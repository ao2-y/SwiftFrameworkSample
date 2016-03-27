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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [SampleClass test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
