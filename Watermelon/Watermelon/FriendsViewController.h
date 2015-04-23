//
//  FriendsViewController.h
//  Watermelon
//
//  Created by Ian Chen on 22/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//
#import "LeaderCell.h"
#import <UIKit/UIKit.h>

@interface FriendsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *Phil;
@property (weak, nonatomic) IBOutlet UITableView *leaderTable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tabs2;

@end
