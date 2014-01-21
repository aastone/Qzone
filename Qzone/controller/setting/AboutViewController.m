//
//  AboutViewController.m
//  Qzone
//
//  Created by wangyipu on 14-1-21.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"about" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}


@end
