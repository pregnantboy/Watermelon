//
//  SetupViewController.h
//  Watermelon
//
//  Created by Ian Chen on 25/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UITextField *serialno;
@property (weak, nonatomic) IBOutlet UITextField *devicename;
@property (weak, nonatomic) IBOutlet UIImageView *tick;
@property (weak, nonatomic) IBOutlet UITextField *gpm;
@property (weak, nonatomic) IBOutlet UIButton *cantfind;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@property (weak, nonatomic) IBOutlet UITextField *seconds;
@property (weak, nonatomic) IBOutlet UIButton *allset;
@property (weak, nonatomic) IBOutlet UIView *barbar;
@property (weak, nonatomic) IBOutlet UIButton *next2;

@end
