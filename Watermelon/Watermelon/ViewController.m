//
//  ViewController.m
//  Watermelon
//
//  Created by Ian Chen on 6/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize loginbutton, signupbutton,username,password, loginview,login,loginwithfb;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *loginlayer = [loginbutton layer];
    [loginlayer setMasksToBounds:YES];
    [loginlayer setCornerRadius:5.0f];
    CALayer *signuplayer = [signupbutton layer];
    [signuplayer setMasksToBounds:YES];
    [signuplayer setCornerRadius:5.0f];
    CALayer *logginlayer = [login layer];
    [logginlayer setMasksToBounds:YES];
    [logginlayer setCornerRadius:5.0f];
    CALayer *logginwithfblayer = [loginwithfb layer];
    [logginwithfblayer setMasksToBounds:YES];
    [logginwithfblayer setCornerRadius:5.0f];
    username.layer.cornerRadius=0.0f;
    username.layer.masksToBounds=YES;
    username.layer.borderColor=[[UIColor grayColor]CGColor];
    username.layer.borderWidth= 1.0f;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    username.leftView = paddingView;
    username.leftViewMode = UITextFieldViewModeAlways;
    password.layer.cornerRadius=0.0f;
    password.layer.masksToBounds=YES;
    password.layer.borderColor=[[UIColor grayColor]CGColor];
    password.layer.borderWidth= 1.0f;
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    password.leftView = paddingView2;
    password.leftViewMode = UITextFieldViewModeAlways;
    
    loginview.alpha = 0;

}

- (IBAction)onclick:(id)sender {
    [UIView beginAnimations:NULL context:NULL];
    [UIView setAnimationDuration:1.0];
    loginview.alpha = 0.9;
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
