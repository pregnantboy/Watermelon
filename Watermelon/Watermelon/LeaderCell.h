//
//  LeaderCell.h
//  Watermelon
//
//  Created by Ian Chen on 22/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *pos;
@property (weak, nonatomic) IBOutlet UILabel *gallons;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UIImageView *challengerpic;
@property (weak, nonatomic) IBOutlet UIImageView *progress;
@property (weak, nonatomic) IBOutlet UILabel *challengername;
@property (weak, nonatomic) IBOutlet UILabel *score;

@end
