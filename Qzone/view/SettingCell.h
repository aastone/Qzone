//
//  SettingCell.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellItem;

@interface SettingCell : UITableViewCell
@property (nonatomic, strong) CellItem *cellItem;

@property (nonatomic, weak) UITableView *myTableView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
