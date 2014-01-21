//
//  LoginViewController.h
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *qq;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
- (IBAction)login;
- (IBAction)rmbPwd:(UIButton *)sender;
- (IBAction)autoLogin:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *autoLogin;
@property (weak, nonatomic) IBOutlet UIButton *rmbPwd;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
