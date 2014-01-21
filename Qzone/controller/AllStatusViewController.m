//
//  AllStatusViewController.m
//  Qzone
//
//  Created by wangyipu on 14-1-21.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "AllStatusViewController.h"
#import "SegmentView.h"
@interface AllStatusViewController ()

@end

@implementation AllStatusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    SegmentView *segmentView = [[SegmentView alloc] init];
    segmentView.titles = @[@"All",@"Special",@"Friends",@"Zones"];
    segmentView.delegate = self;
    self.navigationItem.titleView = segmentView;
}

- (void)segmentView:(SegmentView *)segmentView didSelectedSegmentAtIndex:(int)index
{
    NSLog(@"Pressed -- %d", index);
}

@end
