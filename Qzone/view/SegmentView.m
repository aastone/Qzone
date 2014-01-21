//
//  SegmentView.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//
#define kBtnWidth 90
#define kBtnHeight 35

#import "SegmentView.h"

@interface MyButton : UIButton

@end

@implementation MyButton

- (void)setHighlighted:(BOOL)highlighted{}

@end

@interface SegmentView()
{
    UIButton *_currentBtn;
}

@end
@implementation SegmentView

- (id)initWithTitles:(NSArray *)titles
{
    if (self = [super init]) {
        self.titles = titles;
    }
    return self;
}

- (void)btnDown:(UIButton *)btn
{
    _currentBtn.selected = NO;
    btn.selected = YES;
    _currentBtn = btn;
    
    // call delegate
    if ([self.delegate respondsToSelector:@selector(segmentView:didSelectedSegmentAtIndex:)]) {
        [self.delegate segmentView:self didSelectedSegmentAtIndex:btn.tag];
    }
}

- (void)setTitles:(NSArray *)titles
{
    if ([titles isEqualToArray:_titles]) return;
    
    _titles = titles;
    
    //[UIView beginAnimations:nil context:nil];

    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    int count = titles.count;
    
    for (int i = 0; i<count; i++) {
        MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        btn.frame = CGRectMake(i * kBtnWidth, 0, kBtnWidth, kBtnHeight);

        NSString *normal = nil;
        NSString *selected = nil;
        if (i == 0) { // left
            normal = @"SegmentedControl_Left_Normal.png";
            selected = @"SegmentedControl_Left_Selected.png";
        } else if (i == count - 1) { // right
            normal = @"SegmentedControl_Right_Normal.png";
            selected = @"SegmentedControl_Right_Selected.png";
        } else { // middle
            normal = @"SegmentedControl_Normal.png";
            selected = @"SegmentedControl_Selected.png";
        }
        [btn setBackgroundImage:[UIImage resizeImage:normal] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage resizeImage:selected] forState:UIControlStateSelected];
        
        
        // btn.adjustsImageWhenHighlighted = NO;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchDown];
       
        if (i == 0) {
            [self btnDown:btn];
        }
        
        [self addSubview:btn];
    }
    
    self.bounds = CGRectMake(0, 0, count * kBtnWidth, kBtnHeight);
    
    //[UIView commitAnimations];
}

@end
