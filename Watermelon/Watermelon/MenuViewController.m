//
//  MenuViewController.m
//  Watermelon
//
//  Created by Ian Chen on 16/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import "MenuViewController.h"
@interface MenuViewController()
@end
@implementation MenuViewController


@synthesize phil,gallonspie;

NSString *const fireurl2 = @"https://watermelearn.firebaseio.com/sensor";


- (void)viewDidLoad {
    
    [super viewDidLoad];
    Firebase *ref = [[Firebase alloc] initWithUrl: fireurl2];
    phil.layer.cornerRadius = phil.frame.size.width/2;
    phil.layer.masksToBounds = YES;
     [ref observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
         [self renderPie];
     }];
      
}
-(void) renderPie {
    [self.gallonspie setShowPercentage:FALSE];
    [self.gallonspie setShowLabel:FALSE];
    [self.gallonspie reloadData];
     [self.gallonspie renderInLayer:self.gallonspie dataArray:[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt:153],[NSNumber numberWithInt:(350-153)], nil]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
