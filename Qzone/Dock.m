//
//  Dock.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "Dock.h"
#import "DockItem.h"
#import "IconView.h"
#import "MenuView.h"
#import "ComposeView.h"

@interface Dock()
{
    IconView *_iconView;
    MenuView *_menuView;
    ComposeView *_composeView;
    UIImageView *_divider;
}
@end

@implementation Dock
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Icon
        _iconView = [[IconView alloc] init];
        [_iconView addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_iconView];
        
        // Menu
        _menuView = [[MenuView alloc] init];
        __unsafe_unretained Dock *dock = self;
        _menuView.menuItemClickBlock = ^(DockItem *item){
            if (dock.dockItemClickBlock) {
                dock.dockItemClickBlock(item);
            }
        };
        [self addSubview:_menuView];
        
        // Compose
        _composeView = [[ComposeView alloc] init];
        _composeView.composeItemClickBlock = ^(DockItem *item) {
            if (dock.dockItemClickBlock) {
                dock.dockItemClickBlock(item);
            }
        };
        [self addSubview:_composeView];
        
        
        _divider = [[UIImageView alloc] init];
        _divider.image = [UIImage resizeImage:@"tabbar_separate_ugc_line_v.png"];
        [self addSubview:_divider];
    }
    return self;
}

#pragma mark - Click the icon
- (void)iconClick
{
    
    [_menuView unselectAll];
    
    if (_dockItemClickBlock) {
        DockItem *item = [DockItem itemWithIcon:nil className:@"ProfileViewController"];
        _dockItemClickBlock(item);
    }
}

#pragma mark - Rotate
- (void)rotateToOrientation:(UIInterfaceOrientation)orientation
{
    
    [_composeView rotateToOrientation:orientation];
    
    [_menuView rotateToOrientation:orientation composeFrame:_composeView.frame];
    
    CGFloat dockWidth = _composeView.frame.size.width;
    CGFloat dockHeight = kDockHeight(orientation);
    self.frame = CGRectMake(0, 0, dockWidth, dockHeight);
    
    _divider.frame = CGRectMake(dockWidth, 0, 2, dockHeight);

    [_iconView rotateToOrientation:orientation];
}

@end
