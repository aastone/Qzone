//
//  MenuView.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "MenuView.h"
#import "MenuItemView.h"
#import "DockItem.h"

@interface MenuView()
{
    NSArray *_dockItems;
    MenuItemView *_currentItemView;
}

@end

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addDockItems];
        [self addMenuItemViews];
        
        UIImageView *divider = [[UIImageView alloc] init];
        divider.image = [UIImage resizeImage:@"tabbar_separate_line.png"];
        divider.frame = CGRectMake(0, 0, frame.size.width, 2);
        divider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:divider];
    }
    return self;
}

#pragma mark - Actions
- (void)addDockItems
{
    _dockItems = @[
                   [DockItem itemWithIcon:@"tab_bar_feed_icon.png" title:@"全部动态" className:@"AllStatusViewController"],
                   [DockItem itemWithIcon:@"tab_bar_passive_feed_icon.png" title:@"与我相关" className:@"AboutMeViewController"],
                   [DockItem itemWithIcon:@"tab_bar_pic_wall_icon.png" title:@"照片墙" className:@"PhotoViewController"],
                   [DockItem itemWithIcon:@"tab_bar_friend_icon.png" title:@"好友" className:@"FriendViewController"],
                   [DockItem itemWithIcon:@"tab_bar_app_icon.png" title:@"应用" className:@"AppViewController"],
                   [DockItem itemWithIcon:@"tab_bar_pic_setting_icon.png" title:@"设置" className:@"SettingViewController" modal:YES]
                   ];
}

- (void)addMenuItemViews
{
    int count = _dockItems.count;
    for (int i = 0; i < count; i++) {
        MenuItemView *btn = [[MenuItemView alloc] init];
        btn.frame = CGRectMake(0, i * kDockMenuItemHeight, self.frame.size.width, kDockMenuItemHeight);
        btn.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        btn.dockItem = _dockItems[i];
        [btn addTarget:self action:@selector(menuItemClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
    }
}

- (void)menuItemClick:(MenuItemView *)itemView
{
    if (![itemView.dockItem.title isEqualToString:@"设置"]) {
        _currentItemView.selected = NO;
        itemView.selected = YES;
        _currentItemView = itemView;
    }
    
    if (_menuItemClickBlock) {
        _menuItemClickBlock(itemView.dockItem);
    }
}

- (void)rotateToOrientation:(UIInterfaceOrientation)orientation composeFrame:(CGRect)composeFrame
{
    CGFloat width = composeFrame.size.width;
    CGFloat height = _dockItems.count * kDockMenuItemHeight;
    CGFloat y = composeFrame.origin.y - height;
    self.frame = CGRectMake(0, y, width, height);
}

- (void)unselectAll
{
    _currentItemView.selected = NO;
    _currentItemView = nil;
}

@end
