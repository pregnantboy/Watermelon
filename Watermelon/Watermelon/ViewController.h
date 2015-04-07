//
//  ViewController.h
//  Watermelon
//
//  Created by Ian Chen on 6/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *signupbutton;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;
@property (weak, nonatomic) IBOutlet UIView *loginview;
@property (weak, nonatomic) IBOutlet UIView *login;
@property (weak, nonatomic) IBOutlet UIButton *loginwithfb;

@end

