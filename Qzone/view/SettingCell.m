//
//  SettingCell.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "SettingCell.h"
#import "CellItem.h"

@interface SettingCell()
{
    UISwitch *_switch;
    UIButton *_btn;
    
    // background view
    UIImageView *_bgView;
    UIImageView *_selectedBgView;
}
@end

@implementation SettingCell

- (void)setFrame:(CGRect)frame
{
    CGFloat margin = 15;
    frame.origin.x = -margin;
    frame.size.width += 2 * margin;
    
    [super setFrame:frame];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bgView = [[UIImageView alloc] init];
        self.backgroundView = _bgView;
        _selectedBgView =[[UIImageView alloc] init];
        self.selectedBackgroundView = _selectedBgView;

        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
    }
    return self;
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;

    NSString *centerName = nil;
    int rowsCount = [_myTableView numberOfRowsInSection:indexPath.section];
    if (rowsCount == 1) {
        centerName = @"";
    } else if (indexPath.row == 0) {
        centerName = @"_top";
    } else if (indexPath.row == rowsCount - 1) {
        centerName = @"_bottom";
    } else {
        centerName = @"_middle";
    }
    
    _bgView.image = [UIImage resizeImage:[NSString stringWithFormat:@"common_card%@_background.png", centerName]];
    _selectedBgView.image = [UIImage resizeImage:[NSString stringWithFormat:@"common_card%@_background_highlighted.png", centerName]];
}

- (void)setCellItem:(CellItem *)cellItem
{
    _cellItem = cellItem;
    
    self.textLabel.text = cellItem.title;
    
    if (cellItem.cellItemType == CellItemTypeSwitch) {
        if (_switch == nil) {
            _switch = [[UISwitch alloc] init];
            [_switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
        }
        _switch.on = _cellItem.isOn;
        self.accessoryView = _switch;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if(cellItem.cellItemType == CellItemTypeButton) {
        if (_btn == nil) {
            _btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        }
        self.accessoryView = _btn;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        self.accessoryView = nil;
        self.accessoryType = cellItem.cellItemType;
        
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
}

- (void)switchChange
{
    _cellItem.on = _switch.isOn;
    
    // NSLog(@"%@---%d", _cellItem.title, _switch.isOn);
}

@end
