//
//  SegmentView.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SegmentView;

@protocol SegmentViewDelegate <NSObject>

- (void)segmentView:(SegmentView *)segmentView didSelectedSegmentAtIndex:(int)index;

@end

@interface SegmentView : UIView

- (id)initWithTitles:(NSArray *)titles;

@property (nonatomic, strong)NSArray *titles;
@property (nonatomic, weak) id<SegmentViewDelegate> delegate;

@end
