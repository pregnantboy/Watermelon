//
//  FriendsViewController.m
//  Watermelon
//
//  Created by Ian Chen on 22/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import "FriendsViewController.h"

@implementation FriendsViewController
@synthesize Phil, leaderTable;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Phil.layer.cornerRadius = Phil.frame.size.width/2;
    Phil.layer.masksToBounds = YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSMutableArray *titles = [[NSMutableArray alloc]initWithObjects:@"First rank: Frog",@"You are above average",@"Saved for a European",@"Saved for an American",@"Next rank: Hippopotamus",@"Fill a firetruck", nil];
    NSMutableArray *images = [[NSMutableArray alloc]initWithObjects:@"(achievements) frog.png",@"(achievements)koala.png",@"(achievement)Euro.png",@"(achievement) american.png",@"(achievements)koala.png",@"(achievements)koala.png", nil];
    NSMutableArray *texts = [[NSMutableArray alloc] initWithObjects:@"Welcome! You made the first step to conserve more water with PEPO.",@"Your first shower record showed less than 17 gallons used - less than America's shower average.", @"You saved 50 gallons - what the average European uses a day.",@"You saved 100 gallons - what the average American uses a day.",@"Save 400 gallons to unlock.",@"Save 500 gallons to unlock", nil];
    
    static NSString *cellIdentifier = @"cell2";
    
    LeaderCell *cell = (LeaderCell *)[leaderTable dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[LeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    return cell;
    
}

@end
