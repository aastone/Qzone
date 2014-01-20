//
//  CellItem.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "CellItem.h"

@implementation CellItem

+ (id)itemWithTitle:(NSString *)title cellItemType:(CellItemType)cellItemType
{
    CellItem *item = [[CellItem alloc] init];
    item.cellItemType = cellItemType;
    item.title = title;
    return item;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _on = [[NSUserDefaults standardUserDefaults] boolForKey:title];
}

- (void)setOn:(BOOL)on
{
    _on = on;
    
    [[NSUserDefaults standardUserDefaults] setBool:on forKey:_title];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // call block
    if (_switchChangeBlock) {
        _switchChangeBlock(self);
    }
}

@end
