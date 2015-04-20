//
//  TrackViewController.m
//  Watermelon
//
//  Created by Ian Chen on 7/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//

#import "TrackViewController.h"
#import "DLPieChart.h"
@interface TrackViewController ()

@end

@implementation TrackViewController

@synthesize barChartView, timeStamp,duration,lineChartview,tabs, gridView,piechartberkeley,berkeleyusers,calusers, todayousaved,piechartcal,circ1,circ2,calperc,berkperc, monthdata,weekdata,barChartView2,lineChartView2,labelviews;
NSString *const fireurl = @"https://watermelearn.firebaseio.com/sensor";
double gallons = 2.5;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self daySegment];
    labelviews = [[NSMutableArray alloc]init];
    self.barChartView.backgroundColor =[UIColor clearColor] ;
    barChartView.dataSource = self;
    barChartView.delegate = self;
    self.lineChartview.backgroundColor = [UIColor clearColor];
    lineChartview.dataSource = self;
    lineChartview.delegate = self;
    lineChartview.alpha = 1.0;
    
    barChartView.backgroundColor =[UIColor clearColor] ;
    lineChartView2.alpha = 0.0;
    barChartView2.alpha = 0.0;
    barChartView2.dataSource = self;
    barChartView2.delegate = self;
    lineChartView2.backgroundColor = [UIColor clearColor];
    lineChartView2.dataSource = self;
    lineChartView2.delegate = self;

    barChartView.minimumValue = 0;
    lineChartview.minimumValue = 0;
    barChartView2.minimumValue = 0;
    lineChartView2.minimumValue = 0;
    barChartView2.maximumValue = 150;
    
    lineChartView2.maximumValue = 150;
    int goal = 200;
    UIView *goalframe = [[UIView alloc]initWithFrame:CGRectMake(barChartView.frame.origin.x-50, barChartView.frame.origin.y + (barChartView.frame.size.height - barChartView.frame.size.height*(goal/barChartView.maximumValue)), barChartView.frame.size.width+25, barChartView.frame.size.height*(goal/barChartView.maximumValue))];
    goalframe.backgroundColor = [UIColor blueColor];
    circ1.layer.cornerRadius = 55;
    circ1.layer.masksToBounds = YES;
    circ2.layer.cornerRadius = 55;
    circ2.layer.masksToBounds = YES;
    for (UIView *view1 in self.labelviews){
        [view1 removeFromSuperview];
    }
    self.weekdata = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:78], [NSNumber numberWithInt:105], [NSNumber numberWithInt:70], [NSNumber numberWithInt:88], [NSNumber numberWithInt:101], [NSNumber numberWithInt:93],[NSNumber numberWithInt:120],[NSNumber numberWithInt:79],[NSNumber numberWithInt:121],[NSNumber numberWithInt:93], nil];
}

- (IBAction)tabschanged:(id)sender {
    switch (tabs.selectedSegmentIndex){
        case 0:
            [self daySegment];
            break;
        case 1:
            [self weekSegment];
            break;
        case 2:
            [self monthSegment];
            break;
        default:
            break; 
    };
}

-(void) showfirst:(NSString*)first showsecond:(NSString*)second{
    [UILabel beginAnimations:NULL context:nil];
    [UILabel setAnimationDuration:1.0];
    self.berkperc.alpha = 0;
    self.calperc.alpha=0;
    [UILabel commitAnimations];
    self.berkperc.text = first;
    self.calperc.text = second;
    [UILabel beginAnimations:NULL context:nil];
    [UILabel setAnimationDuration:1.0];
    self.berkperc.alpha = 1;
    self.calperc.alpha=1;
    [UILabel commitAnimations];
}
-(void) daySegment{
    barChartView.dataSource = self;
    barChartView.delegate = self;
    lineChartview.dataSource = self;
    lineChartview.delegate = self;
       Firebase *ref = [[Firebase alloc] initWithUrl: fireurl];
    self.timeStamp = [[NSMutableArray alloc] init];
 
    [ref observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        lineChartView2.alpha = 0;
        barChartView2.alpha =0;
        lineChartview.alpha = 1;
        barChartView.alpha =1;
        for (UIView *view1 in self.labelviews){
            [view1 removeFromSuperview];
        }
        NSMutableArray *labels = [[NSMutableArray alloc] initWithObjects:@"",@"last shower", nil];
        for (int i = 0; i < 2; i++){
            //axis labels
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-30+(i*51), self.barChartView2.bounds.origin.y+ self.barChartView2.bounds.size.height/1.3, 200, 80)];
            [label setBackgroundColor:[UIColor clearColor]];
            [label setText:[labels objectAtIndex:i]];
            label.font = [UIFont fontWithName:@"Helvetica" size:11];
            label.textColor = [UIColor whiteColor];
            if (i==0){
                label.textColor = [UIColor colorWithRed:42/255.0 green:167/255.0   blue:208/255.0 alpha:1];
                
            }
            label.transform=CGAffineTransformMakeRotation( ( -90 * M_PI ) / 180 );
            [self.view addSubview:label];
            [self.labelviews addObject:label];
        }
        todayousaved.text = @"Today you saved more water than";
        [self setpie1:30 setpie2:54];
        [self showfirst:@"30%" showsecond:@"54%"];
        
    }];
    [ref observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        //NSLog(@"%@", snapshot.value[@"timeStamp"]);
        if ([snapshot.value[@"value"] intValue]> 100){
            if ([snapshot.value[@"timeStamp"]longValue] >1000000) {
                NSNumber *insertion = [NSNumber numberWithLong:[snapshot.value[@"timeStamp"]longValue]];
                [timeStamp insertObject: insertion atIndex:0];
                [self updateData: [snapshot.value[@"timeStamp"]longValue]];
                [barChartView reloadData];
                [lineChartview reloadData];
            }
            else{
                //NSLog(@"error in timestamp %@", snapshot.key);
            }
        }
    
    }];
    
    for (NSNumber *value in self.duration) {
        
        //NSLog(@"%d,",[value intValue]);
    }
    //NSLog(duration);
    
    //barChartView.layer.borderWidth = 1;
    
    barChartView.maximumValue = 320;
    
    lineChartview.maximumValue = 320;
    
    
    
    
    [barChartView reloadData];
    [lineChartview reloadData];
    
 }

-(void) setpie1: (int)int1 setpie2:(int)int2 {
    [self.piechartberkeley setShowPercentage:FALSE];
    [self.piechartberkeley setShowLabel:FALSE];
    [self.piechartberkeley setBackgroundColor:[UIColor clearColor]];
    [self.piechartberkeley renderInLayer:self.piechartberkeley dataArray:[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt:int1],[NSNumber numberWithInt:(100-int1)], nil]];
    [self.piechartcal setShowPercentage:FALSE];
    [self.piechartcal setShowLabel:FALSE];
    [self.piechartcal setBackgroundColor:[UIColor clearColor]];
    [self.piechartcal renderInLayer:self.piechartcal dataArray:[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt:int2],[NSNumber numberWithInt:(100-int2)], nil]];
    
}



- (void) weekSegment{
    barChartView2.maximumValue = 150;
    lineChartView2.maximumValue = 150;
    lineChartview.alpha = 0;
    barChartView.alpha =0;
    lineChartView2.alpha = 1;
    barChartView2.alpha =1;
    [self setpie1:25 setpie2:49];
    [self showfirst:@"25%" showsecond:@"49%"];
    self.weekdata = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:78], [NSNumber numberWithInt:105], [NSNumber numberWithInt:70], [NSNumber numberWithInt:88], [NSNumber numberWithInt:101], [NSNumber numberWithInt:93],[NSNumber numberWithInt:120],[NSNumber numberWithInt:79],[NSNumber numberWithInt:121],[NSNumber numberWithInt:93], nil];
    [barChartView2 reloadData];
    [lineChartView2 reloadData];
    for (UIView *view1 in self.labelviews){
        [view1 removeFromSuperview];
    }
    NSMutableArray *labels = [[NSMutableArray alloc] initWithObjects:@"this week",@"last week",@"27Apr - 3May", @"20Apr - 26Apr",@"13Apr - 19Apr",@"6Apr - 12Apr", nil];
    for (int i = 0; i < 6; i++){
        //axis labels
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-30+(i*51), self.barChartView2.bounds.origin.y+ self.barChartView2.bounds.size.height/1.3, 200, 80)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[labels objectAtIndex:i]];
        label.font = [UIFont fontWithName:@"Helvetica" size:11];
        label.textColor = [UIColor whiteColor];
        if (i>1){
            label.textColor = [UIColor colorWithRed:42/255.0 green:167/255.0   blue:208/255.0 alpha:1];

        }
        label.transform=CGAffineTransformMakeRotation( ( -90 * M_PI ) / 180 );
        [self.view addSubview:label];
        [self.labelviews addObject:label];
    }
    
    todayousaved.text = @"This week you saved more water than";
}

-(void) monthSegment{
    barChartView2.maximumValue = 600;
    lineChartView2.maximumValue = 600;
    lineChartview.alpha = 0;
    barChartView.alpha =0;
    lineChartView2.alpha = 1;
    barChartView2.alpha =1;
    self.weekdata = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:420], [NSNumber numberWithInt:405], [NSNumber numberWithInt:490], [NSNumber numberWithInt:435], [NSNumber numberWithInt:460], [NSNumber numberWithInt:457],[NSNumber numberWithInt:401],[NSNumber numberWithInt:506],[NSNumber numberWithInt:412],[NSNumber numberWithInt:455], nil];
    [self setpie1:54 setpie2:79];
    [self showfirst:@"54%" showsecond:@"79%"];
    [barChartView2 reloadData];
    [lineChartView2 reloadData];
    for (UIView *view1 in self.labelviews){
        [view1 removeFromSuperview];
    }
    NSMutableArray *labels = [[NSMutableArray alloc] initWithObjects:@"this month",@"last month",@"Mar 15", @"Feb 15",@"Jan 15",@"Dec 14", nil];
    for (int i = 0; i < 6; i++){
        //axis labels
         UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-30+(i*51), self.barChartView2.bounds.origin.y+ self.barChartView2.bounds.size.height/1.3, 200, 80)];        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[labels objectAtIndex:i]];
        label.font = [UIFont fontWithName:@"Helvetica" size:11];
        label.textColor = [UIColor whiteColor];
        if (i>1){
            label.textColor = [UIColor colorWithRed:42/255.0 green:167/255.0   blue:208/255.0 alpha:1];
        }
        label.transform=CGAffineTransformMakeRotation( ( -90 * M_PI ) / 180 );
        [self.view addSubview:label];
        [self.labelviews addObject:label];
    }
    
    todayousaved.text = @"This month you saved more water than";
}

-(void) updateData: (long)onetime{
    
    self.duration =[[NSMutableArray alloc] init];
    NSNumber *zero = [NSNumber numberWithInt:0] ;
    [self.duration insertObject: zero atIndex:0];
    int timestampscount = self.timeStamp.count -1;
    long prevtimeStamp = [[self.timeStamp objectAtIndex:(timestampscount)] longValue];
    for (int i = timestampscount-1; i >= 0; i--) {
        long currtimeStamp = [[self.timeStamp objectAtIndex:i] longValue];
        long difference = currtimeStamp - prevtimeStamp;
        //if (difference <0) NSLog(@"%ld - %ld", currtimeStamp, prevtimeStamp);
        if ((difference<30)&&(difference>0)){
            long newduration =[[duration objectAtIndex:0] longValue] + difference;
            if ([[duration objectAtIndex:0] longValue]<0 ) NSLog (@"error in duration ");
            NSNumber* replacement = [NSNumber numberWithLong: newduration];
            [self.duration replaceObjectAtIndex:0 withObject:replacement];
        }
        else {
            if ([[self.duration objectAtIndex:0] intValue] > 20){
                [self.duration insertObject: zero atIndex:0];
            }
            else {
                [self.duration replaceObjectAtIndex:0 withObject:zero];
            }
        }
        prevtimeStamp = currtimeStamp;
    }
}
- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    if(barChartView==barChartView2){
        return 6;
    }
       return 6;
}



- (UIColor *)barChartView:(JBBarChartView *)barChartView colorForBarViewAtIndex:(NSUInteger)index{
     if(tabs.selectedSegmentIndex==0){
         if (index == 0){
             if ([self.duration count]>2){
                 int height1 = [[self.duration objectAtIndex:0]intValue];
                 int height2 = [[self.duration objectAtIndex:1]intValue];
                 if (height1<=height2) return [UIColor  colorWithRed:83/255.0 green:215/255.0 blue:148/255.0 alpha:0.9];
                 else return [UIColor  colorWithRed:231/255.0 green:126/255.0 blue:120/255.0 alpha:1];

             }
                else return [UIColor colorWithRed:25/255.0 green:181/255.0 blue:254/255.0 alpha:1];

         }
        if (index == 1){
        //return [UIColor colorWithRed:129/255.0 green:207/255.0 blue:224/255.0 alpha:1];
                return [UIColor colorWithRed:25/255.0 green:181/255.0 blue:254/255.0 alpha:1];
        }
        else {
            return [UIColor whiteColor];
        }
     }
    else{
        if (index == 0){
            if ([self.weekdata count]>2){
                int height1 = [[self.weekdata objectAtIndex:0]intValue];
                int height2 = [[self.weekdata objectAtIndex:1]intValue];
                if (height1<=height2) return [UIColor  colorWithRed:83/255.0 green:215/255.0 blue:148/255.0 alpha:0.9];
                else return [UIColor  colorWithRed:231/255.0 green:126/255.0 blue:120/255.0 alpha:1];
                
            }
            else return [UIColor colorWithRed:25/255.0 green:181/255.0 blue:254/255.0 alpha:1];
            
        }
        if (index == 1){
            //return [UIColor colorWithRed:129/255.0 green:207/255.0 blue:224/255.0 alpha:1];
            return [UIColor colorWithRed:25/255.0 green:181/255.0 blue:254/255.0 alpha:1];
        }
        else {
            return [UIColor whiteColor];
        }
    }
    
    
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
    if (lineIndex ==1){
        return [UIColor colorWithRed:249.0/255.0 green:191.0/255.0 blue:53.0/255.0 alpha:0.9];
    }
    return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
}
- (BOOL)lineChartView:(JBLineChartView *)lineChartView showsDotsForLineAtLineIndex:(NSUInteger)lineIndex{
    return true;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex{
    return true;
}
- (CGFloat)lineChartView:(JBLineChartView *)lineChartView dotRadiusForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex{
    if (lineIndex == 1) return 0;
    return 2.0;
}
- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    if (lineIndex==1){
        return [UIColor clearColor];
    }
    return [UIColor colorWithRed:(107.0/255.0) green:(185.0/255.0) blue:(240.0/255.0) alpha:0.5];
}
- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index
{
    if(tabs.selectedSegmentIndex==0){
        if ([self.duration count] > index)  {
            int height = [[self.duration objectAtIndex: index] intValue];
            if (height<0){
            //NSLog(@"%d", height);
                return  0;
            }
            //if (index == 0) NSLog(@"%d",height);
            return height*gallons ; // height of bar at index
        }
        else return 0;
    }
    else{
        return [[self.weekdata objectAtIndex:index]intValue];
    }
    return 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartview
{
    return 2; // number of lines in chart
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex
{
    if(barChartView==barChartView2){
        return 8;
    }
    return 6;
}
- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    if(tabs.selectedSegmentIndex==0){
        if (lineIndex==1){
            return 200;
        }
        if ([self.duration count] > horizontalIndex)  {
            int height = [[self.duration objectAtIndex: horizontalIndex] intValue];
            if (height<0){
                //NSLog(@"%d", height);
                return  0;
            }
        //if (index == 0) NSLog(@"%d",height);
            return height*gallons ; // height of bar at index
        }
        else return 0;
    }
    if (tabs.selectedSegmentIndex==1){
        if (lineIndex ==1){
            return 100;
        }
        return [[self.weekdata objectAtIndex:horizontalIndex]intValue];
    }
    if (tabs.selectedSegmentIndex==2){
        if (lineIndex ==1){
            return 510;
        }
        return [[self.weekdata objectAtIndex:horizontalIndex]intValue];
    }
    return 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
