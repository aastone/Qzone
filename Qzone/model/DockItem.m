//
//  DockItem.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "DockItem.h"

@implementation DockItem

+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title className:(NSString *)className modal:(BOOL)modal
{
    DockItem *item = [[DockItem alloc] init];
    item.icon = icon;
    item.title = title;
    item.className = className;
    item.modal = modal;
    return item;
}

+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title className:(NSString *)className
{
    return [self itemWithIcon:icon title:title className:className modal:NO];
}

+ (id)itemWithIcon:(NSString *)icon className:(NSString *)className modal:(BOOL)modal
{
    return [self itemWithIcon:icon title:nil className:className modal:modal];
}

+ (id)itemWithIcon:(NSString *)icon className:(NSString *)className
{
    return [self itemWithIcon:icon title:nil className:className modal:NO];
}

@end
