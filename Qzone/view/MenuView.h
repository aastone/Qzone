//
//  MenuView.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DockItem;
@interface MenuView : UIView

- (void)rotateToOrientation:(UIInterfaceOrientation)orientation composeFrame:(CGRect)composeFrame;

@property (nonatomic, copy) void (^menuItemClickBlock) (DockItem *item);

- (void)unselectAll;

@end
