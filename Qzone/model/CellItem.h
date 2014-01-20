//
//  CellItem.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CellItemTypeNone,
    CellItemTypeDisclosureIndicator,
    CellItemTypeDetailDisclosureButton,
    CellItemTypeCheckmark,
    CellItemTypeSwitch,
    CellItemTypeButton
} CellItemType;

@interface CellItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *className;

// callback when u click one line
@property (nonatomic, copy) void (^cellClickBlock)(CellItem *item);
// callback when the switch statu changed
@property (nonatomic, copy) void (^switchChangeBlock)(CellItem *item);

@property (nonatomic, assign) CellItemType cellItemType;
@property (nonatomic, assign, getter = isOn) BOOL on;

+ (id)itemWithTitle:(NSString *)title cellItemType:(CellItemType)cellItemType;
@end
