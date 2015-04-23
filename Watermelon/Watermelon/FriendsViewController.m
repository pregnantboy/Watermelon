//
//  FriendsViewController.m
//  Watermelon
//
//  Created by Ian Chen on 22/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import "FriendsViewController.h"

@implementation FriendsViewController
@synthesize Phil, leaderTable,tabs2;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Phil.layer.cornerRadius = Phil.frame.size.width/2;
    Phil.layer.masksToBounds = YES;
    
}
- (IBAction)tabschanged:(id)sender {
    [leaderTable reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSMutableArray *poss = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4", nil];
    NSMutableArray *names = [[NSMutableArray alloc] initWithObjects:@"Mitchell Pritchett",@"Jay Pritchett",@"Me",@"Alex Dunphy",nil];
    NSMutableArray *ranks = [[NSMutableArray alloc] initWithObjects:@"Rank:Elephant",@"Rank:Hippo",@"Rank:Frog",@"Rank:Frog",nil];
    NSMutableArray *gallonss = [[NSMutableArray alloc] initWithObjects:@"62",@"68",@"85",@"98",nil];
    NSMutableArray *pics = [[NSMutableArray alloc] initWithObjects:@"(friends leaderboard) mitchel.png",@"(friends leaderboard) jay.png",@"Phil.jpg",@"(friends leaderboard) alex.png",nil];
    NSMutableArray *scores = [[NSMutableArray alloc] initWithObjects:@"3 vs 2",@"5 vs 3",nil];
    NSMutableArray *progresses = [[NSMutableArray alloc] initWithObjects:@"(friends challenge) inprogress.png",@"(friends challenge) champ.png", nil];
    NSMutableArray *chalnames = [[NSMutableArray alloc] initWithObjects:@"Mitchell P.",@"Jay P.", nil];
 
    static NSString *cellIdentifier;
    if (tabs2.selectedSegmentIndex==0){
        cellIdentifier = @"cell2";
    }
    else{
        cellIdentifier = @"cell3";
    }
    LeaderCell *cell = (LeaderCell *)[leaderTable dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[LeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.pos.text = [poss objectAtIndex:indexPath.row];
    cell.name.text = [names objectAtIndex:indexPath.row];
    cell.rank.text = [ranks objectAtIndex:indexPath.row];
    cell.gallons.text = [gallonss objectAtIndex:indexPath.row];
    cell.pic.image = [UIImage imageNamed:[pics objectAtIndex:indexPath.row]];
    cell.pic.layer.cornerRadius = cell.pic.frame.size.width/2;
    cell.pic.layer.masksToBounds = YES;
    if (indexPath.row ==2){
        cell.backgroundColor= [UIColor colorWithRed:189/255.0 green:(195/255.0) blue:199/255.0 alpha:1];
    }
    if (tabs2.selectedSegmentIndex==1){
        cell.score.text = [scores objectAtIndex:indexPath.row];
        cell.challengername.text = [chalnames objectAtIndex:indexPath.row];
        cell.challengerpic.image =[UIImage imageNamed:[pics objectAtIndex:indexPath.row]];
        cell.progress.image =[UIImage imageNamed:[progresses objectAtIndex:indexPath.row ]];
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    if (tabs2.selectedSegmentIndex==0){
       return 4 ;
    }
    else{
        return 2;
    }
    
}


@end
