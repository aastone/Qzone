//
//  LoginViewController.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = kGlobalBg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertError:(NSString *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"login failed" message:error delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    anim.repeatCount = 1;
    anim.values = @[@-10, @10, @-10];
    [_loginView.layer addAnimation:anim forKey:nil];
}

#pragma mark - Login Acitions

- (void)loginSuccess
{
    [_indicator stopAnimating];
    self.view.userInteractionEnabled = YES;
//    [self performSegueWithIdentifier:@"home" sender:nil];
    NSLog(@"success");
}

- (IBAction)login
{
    if (_qq.text.length == 0) {
        [self alertError:@"Please input the account"];
        NSLog(@"qq");
        return;
    }
    
    if (_pwd.text.length == 0) {
        [self alertError:@"Please input the password"];
        return;
    }
    
    self.view.userInteractionEnabled = NO;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(loginSuccess) userInfo:nil repeats:NO];
}

- (IBAction)rmbPwd:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    if (!sender.isSelected) {
        _autoLogin.selected = NO;
    }
}

- (IBAction)autoLogin:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    if (sender.isSelected) {
        _rmbPwd.selected = YES;
    }
}
@end
