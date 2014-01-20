//
//  IconView.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "IconView.h"
#import <QuartzCore/QuartzCore.h>

#define kIconMaxWidth 100
#define kIconMaxHeight 100

@implementation IconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.layer.cornerRadius = 5;
        self.imageView.layer.masksToBounds = YES;
        
        [self setImage:[UIImage imageNamed:@"default_person_lit.png"] forState:UIControlStateNormal];
        [self setTitle:@"haha" forState:UIControlStateNormal];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)rotateToOrientation:(UIInterfaceOrientation)orientation
{
    CGFloat width = self.superview.frame.size.width;
    self.frame = CGRectMake(0, 0, width, width);
    
    NSString *title = UIInterfaceOrientationIsPortrait(orientation) ? nil:@"haha";
    [self setTitle:title forState:UIControlStateNormal];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 150;
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHeight = 50;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end
