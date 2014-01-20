//
//  Dock.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DockItem;
@interface Dock : UIView

// 旋转到某一个方向
- (void)rotateToOrientation:(UIInterfaceOrientation)orientation;


@property (nonatomic, copy) void (^dockItemClickBlock)(DockItem *item);
@end
