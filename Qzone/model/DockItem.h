//
//  DockItem.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DockItem : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *className; // after click Item then open the controllers
@property (nonatomic, assign) BOOL modal;

+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title className:(NSString *)className modal:(BOOL)modal;
+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title className:(NSString *)className;

+ (id)itemWithIcon:(NSString *)icon className:(NSString *)className modal:(BOOL)modal;
+ (id)itemWithIcon:(NSString *)icon className:(NSString *)className;

@end
