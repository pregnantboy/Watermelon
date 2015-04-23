//
//  AchievementViewController.m
//  Watermelon
//
//  Created by Ian Chen on 20/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import "AchievementViewController.h"

@implementation AchievementViewController
@synthesize tableView
;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 6;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSMutableArray *titles = [[NSMutableArray alloc]initWithObjects:@"First rank: Frog",@"You are above average",@"Saved for a European",@"Saved for an American",@"Next rank: Hippopotamus",@"Fill a firetruck", nil];
    NSMutableArray *images = [[NSMutableArray alloc]initWithObjects:@"(achievements) frog.png",@"(achievements)koala.png",@"(achievement)Euro.png",@"(achievement) american.png",@"(achievement) question mark.png",@"(achievement) question mark 2.png", nil];
    NSMutableArray *texts = [[NSMutableArray alloc] initWithObjects:@"Welcome! You made the first step to conserve more water with PEPO.",@"Your first shower record showed less than 17 gallons used - less than America's shower average.", @"You saved 50 gallons - what the average European uses a day.",@"You saved 100 gallons - what the average American uses a day.",@"Save 400 gallons to unlock.",@"Save 500 gallons to unlock", nil];
    
    static NSString *cellIdentifier = @"cell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.maintitle.text = [titles objectAtIndex:indexPath.row];
    cell.picture.image = [UIImage imageNamed: [images objectAtIndex:indexPath.row]];
    cell.textblock.text = [texts objectAtIndex: indexPath.row];
    cell.achieve.image = [UIImage imageNamed:@"(achievement) unlocked.png"];
    if ((indexPath.row%2) ==0){
        cell.backgroundColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];
        cell.textblock.textColor = [UIColor whiteColor];
        cell.maintitle.textColor = [UIColor whiteColor];
    }
    else{
        cell.backgroundColor = [UIColor whiteColor];
        cell.textblock.textColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];
        cell.maintitle.textColor = [UIColor colorWithRed:42/255.0 green:167/255.0 blue:208/255.0 alpha:1];

    }
    if (indexPath.row>3){
        cell.achieve.image = [UIImage imageNamed:@"(achievement) locked.png"];
        cell.backgroundColor = [UIColor colorWithRed:189/255.0 green:195/255.0 blue:199/255.0 alpha:1];
        cell.textblock.textColor = [UIColor colorWithRed:108/255.0 green:122/255.0 blue:137/255.0 alpha:1];
        cell.maintitle.textColor = [UIColor colorWithRed:108/255.0 green:122/255.0 blue:137/255.0 alpha:1];
        if (indexPath.row ==5){
            cell.backgroundColor = [UIColor colorWithRed:189/255.0 green:195/255.0 blue:199/255.0 alpha:0.6];
        }
    }
    if (indexPath.row ==2)cell.picture.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    if (indexPath.row == 3)cell.picture.backgroundColor = [UIColor colorWithRed:89/255.0 green:171/255.0 blue:227/255.0 alpha:0.5];

    return cell;
    
}
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:[NSString stringWithFormat:@"Selected Value is "] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alertView show];
    
}
*/
@end


