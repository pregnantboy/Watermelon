//
//  MenuViewController.h
//  Watermelon
//
//  Created by Ian Chen on 16/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//
#import "DLPieChart.h"
#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
@interface MenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *phil;
@property (weak, nonatomic) IBOutlet DLPieChart *gallonspie;

@end
