//
//  ComposeView.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//



#import "ComposeView.h"
#import "DockItem.h"

@interface ComposeView()
{
    NSArray *_dockItems;
    
    // all buttons
    NSMutableArray *_btns;
    // all dividers
    NSMutableArray *_dividers;
}
@end

@implementation ComposeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Add all DockItem
        [self addDockItems];
        
        // Add all buttons
        [self addBtns];
    }
    return self;
}

#pragma mark - Actions
- (void)addDockItems
{
    _dockItems = @[
                   [DockItem itemWithIcon:@"tabbar_mood.png" className:nil modal:YES],
                   [DockItem itemWithIcon:@"tabbar_photo.png" className:nil modal:YES],
                   [DockItem itemWithIcon:@"tabbar_blog.png" className:nil modal:YES]
                   ];
}

- (void)addBtns
{
    _btns = [NSMutableArray array];
    _dividers = [NSMutableArray array];
    
    int count = _dockItems.count;
    for (int i = 0; i<count; i++) {
        DockItem *item = _dockItems[i];
        
        // add button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        // set image
        [btn setImage:[UIImage imageNamed:item.icon] forState:UIControlStateNormal];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(composeItemClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btns addObject:btn];
        
        //add divider
        if (i != 0) {
            UIImageView *divider = [[UIImageView alloc] init];
            divider.image = [UIImage imageNamed:@"tabbar_separate_ugc_line_v.png"];
            [self addSubview:divider];
            [_dividers addObject:divider];
        }
    }
}

- (void)composeItemClick:(UIButton *)btn
{
    if (_composeItemClickBlock) {
        _composeItemClickBlock(_dockItems[btn.tag]);
    }
}

#pragma mark - rotate
- (void)rotateToOrientation:(UIInterfaceOrientation)orientation
{
    CGFloat x = 0;
    CGFloat width = 0;
    CGFloat height = 0;
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        //Horizontal
        int btnCount = _btns.count;
        for (int i = 0; i<btnCount; i++) {
            UIButton *btn = _btns[i];
            btn.frame = CGRectMake(i * kDockComposeItemWidthL, 0, kDockComposeItemWidthL, kDockComposeItemHeightL);
        }
        width = btnCount * kDockComposeItemWidthL;
        height = kDockComposeItemHeightL;
        
        
        int dividerCount = _dividers.count;
        for (int i = 0; i<dividerCount; i++) {
            UIImageView *divider = _dividers[i];
            divider.hidden = NO;
            divider.frame = CGRectMake((i + 1) * kDockComposeItemWidthL, 0, 2, kDockComposeItemHeightL);
        }
    } else {
        //Portrait
        int btnCount = _btns.count;
        for (int i = 0; i<btnCount; i++) {
            UIButton *btn = _btns[i];
            btn.frame = CGRectMake(0, i * kDockComposeItemHeightP, kDockComposeItemWidthP, kDockComposeItemHeightP);
        }
        width = kDockComposeItemWidthP;
        height = btnCount * kDockComposeItemHeightP;
        
        int dividerCount = _dividers.count;
        for (int i = 0; i<dividerCount; i++) {
            UIImageView *divider = _dividers[i];
            divider.hidden = YES;
        }
    }
    
    CGFloat y = kDockHeight(orientation) - height;
    self.frame = CGRectMake(x, y, width, height);
}
@end
