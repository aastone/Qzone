//
//  MenuItemView.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "MenuItemView.h"
#import "DockItem.h"

@interface MenuItemView()
{
    UIImageView *_divider;
}
@end

@implementation MenuItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.adjustsImageWhenHighlighted = NO;
        
        _divider = [[UIImageView alloc] init];
        _divider.image = [UIImage resizeImage:@"tabbar_separate_line.png"];
        _divider.frame = CGRectMake(0, kDockMenuItemHeight, 0, 2);
        _divider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_divider];
        
        [self setBackgroundImage:[UIImage resizeImage:@"tabbar_separate_selected_bg.png"] forState:UIControlStateSelected];
    }
    return self;
}

#pragma mark - Actions

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    _divider.hidden = selected;
}

- (void)setDockItem:(DockItem *)dockItem
{
    _dockItem = dockItem;
    [self setImage:[UIImage imageNamed:dockItem.icon] forState:UIControlStateNormal];
    [self setTitle:dockItem.title forState:UIControlStateNormal];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, kDockMenuItemHeight, kDockMenuItemHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat width = contentRect.size.width - kDockMenuItemHeight;
    return CGRectMake(kDockMenuItemHeight, 0, width, kDockMenuItemHeight);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
