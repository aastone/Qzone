//
//  HomeViewController.m
//  Qzone
//
//  Created by wangyipu on 14-1-21.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "HomeViewController.h"
#import "Dock.h"
#import "DockItem.h"

@interface HomeViewController ()
{
    Dock *_dock;
    //record all child-controllers
    NSMutableDictionary *_allChilds;
    
    UINavigationController *_currentChild;
}

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _allChilds = [NSMutableDictionary dictionary];
    __unsafe_unretained HomeViewController *home = self;
    
    _dock = [[Dock alloc] init];
    _dock.dockItemClickBlock = ^(DockItem *item) {
        [home selectChildWithItem:item];
    };
    [_dock rotateToOrientation:self.interfaceOrientation];
    [self.view addSubview:_dock];
    
    self.view.backgroundColor = kGlobalBg;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout) name:@"logout" object:nil];
    [home selectChildWithItem:[DockItem itemWithIcon:nil className:@"ProfileViewController"]];
}

- (void)logout
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
        // 根据即将要显示的方向来调整dock内部的布局
        [_dock rotateToOrientation:toInterfaceOrientation];
        
        // 调整当前选中控制器view的frame
        CGFloat width = 768 - kDockMenuItemHeight;
        _currentChild.view.frame = CGRectMake(_dock.frame.size.width, 0, width, _dock.frame.size.height);
    }];
}

#pragma mark - Switch controller
- (void)selectChildWithItem:(DockItem *)item
{
    UINavigationController *nav = _allChilds[item.className];
    if (nav == nil) {
        Class c = NSClassFromString(item.className);
        UIViewController *vc = [[c alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        nav.view.autoresizingMask = UIViewAutoresizingNone;
        vc.view.backgroundColor = kGetColor(220, 220, 220);
        
        if (item.modal) {
            nav.modalPresentationStyle = UIModalPresentationFormSheet;
            [self presentViewController:nav animated:YES completion:nil];
            return;
        }
        
        // 添加手势监听器
        [nav.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragNavView:)]];
        
        // 建立控制器之间的父子关系
        // 建议：两个控制器互为父子关系，那么它们的view也应该互为父子关系
        [self addChildViewController:nav];
        [_allChilds setObject:nav forKey:item.className];
    }
    if (_currentChild == nav) return;
    
    // 2.移除旧控制器的view
    [_currentChild.view removeFromSuperview];
    
    CGFloat width = 768 - kDockMenuItemHeight;
    nav.view.frame = CGRectMake(_dock.frame.size.width, 0, width, _dock.frame.size.height);
    [self.view addSubview:nav.view];
    
    _currentChild = nav;
}

- (void)dragNavView:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {// 手势结束
        [UIView animateWithDuration:0.2 animations:^{
            pan.view.transform = CGAffineTransformIdentity;
        }];
    } else {
        CGFloat tx = [pan translationInView:pan.view].x;
        pan.view.transform = CGAffineTransformMakeTranslation(tx * 0.5, 0);
    }
}

- (void)dealloc
{
    // 移除通知的监听器
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"logout" object:nil];
}

@end
