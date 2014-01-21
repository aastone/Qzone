//
//  FriendViewController.m
//  Qzone
//
//  Created by wangyipu on 14-1-21.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "FriendViewController.h"
#import "SegmentView.h"

@interface FriendViewController ()

@end

@implementation FriendViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    SegmentView *segment = [[SegmentView alloc] init];
    segment.titles = @[@"Friends",@"Special"];
    self.navigationItem.titleView = segment;
}



@end
