//
//  MenuItemView.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DockItem;
@interface MenuItemView : UIButton
@property (nonatomic, strong) DockItem *dockItem;
@end
