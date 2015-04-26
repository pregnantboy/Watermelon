//
//  SetupViewController.m
//  Watermelon
//
//  Created by Ian Chen on 25/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//
#import <Firebase/Firebase.h>
#import "SetupViewController.h"

@implementation SetupViewController
@synthesize next,serialno,devicename,tick,gpm,seconds,allset,barbar,next2;

NSString *const fireurl3 = @"https://watermelearn.firebaseio.com/sensor2";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    next.backgroundColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];
    next2.backgroundColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];
    allset.backgroundColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    gpm.layer.cornerRadius=15.0f;
    gpm.layer.masksToBounds=YES;
    gpm.layer.borderColor=[[UIColor grayColor]CGColor];
    gpm.layer.borderWidth= 1.0f;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 10, 20)];
    gpm.leftView = paddingView;
    gpm.leftViewMode = UITextFieldViewModeAlways;
    serialno.layer.cornerRadius=15.0f;
    serialno.layer.masksToBounds=YES;
    serialno.layer.borderColor=[[UIColor grayColor]CGColor];
    serialno.layer.borderWidth= 1.0f;
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 10, 20)];
    serialno.leftView = paddingView2;
    serialno.leftViewMode = UITextFieldViewModeAlways;
    devicename.layer.cornerRadius=15.0f;
    devicename.layer.masksToBounds=YES;
    devicename.layer.borderColor=[[UIColor grayColor]CGColor];
    devicename.layer.borderWidth= 1.0f;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 10, 20)];
    devicename.leftView = paddingView1;
    devicename.leftViewMode = UITextFieldViewModeAlways;
    seconds.layer.cornerRadius=15.0f;
    seconds.layer.masksToBounds=YES;
    seconds.layer.borderColor=[[UIColor grayColor]CGColor];
    seconds.layer.borderWidth= 1.0f;
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 10, 20)];
    seconds.leftView = paddingView3;
    seconds.leftViewMode = UITextFieldViewModeAlways;
    barbar.layer.cornerRadius=30.0f;
    barbar.layer.masksToBounds=YES;
    barbar.layer.borderColor=[[UIColor blackColor]CGColor];
    barbar.layer.borderWidth= 1.0f;
    barbar.backgroundColor = [UIColor clearColor];
    Firebase *ref = [[Firebase alloc] initWithUrl: fireurl3];
    [ref observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        int value = [snapshot.value[@"value"] intValue];
        [self drawBar: value];
    }];
}

-(void)dismissKeyboard {
    [serialno resignFirstResponder];
    [devicename resignFirstResponder];
    [gpm resignFirstResponder];
    [seconds resignFirstResponder];
}
- (IBAction)onclick:(id)sender {
    [UIView beginAnimations:NULL context:NULL];
    [UIView setAnimationDuration:0.8];
    self.view2.alpha = 1;
    [UIView commitAnimations];
    NSLog(@"change!");

}
- (void) drawBar:(int) length{
    if (length > 150){
        length = 150;
    }
    if (length>80){
        barbar.backgroundColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];
    }
    else {
        barbar.backgroundColor = [UIColor  colorWithRed:231/255.0 green:126/255.0 blue:120/255.0 alpha:1];
    }
    [barbar setFrame:CGRectMake(barbar.frame.origin.x, barbar.frame.origin.y, length*2, barbar.frame.size.height)];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (serialno.text.length >= 10 && range.length == 0)
    {
        
        return NO; // return NO to not change text
    }
    else
    {
        if (serialno.text.length >= 9&& range.length == 0){
            tick.alpha = 1.0;
        }
        else{
            tick.alpha = 0.0;
        }
        return YES;
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == gpm){
        [UIView beginAnimations:NULL context:NULL];
        [UIView setAnimationDuration:0.8];
         self.view2.alpha = 0;
        [UIView commitAnimations];
    }
    return YES;
}


@end