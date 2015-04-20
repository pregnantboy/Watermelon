//
//  TrackViewController.h
//  Watermelon
//
//  Created by Ian Chen on 7/4/15.
//  Copyright (c) 2015 Ian Chen. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "JBChartView.h"
#import "JBBarChartView.h"
#import "JBLineChartView.h"
#import "DLPieChart.h"
#import <Firebase/Firebase.h>

@interface TrackViewController : UIViewController
@property (weak, nonatomic) IBOutlet JBBarChartView *barChartView;
@property (weak, nonatomic) IBOutlet JBLineChartView *lineChartView2;
@property (weak, nonatomic) IBOutlet JBBarChartView *barChartView2;
@property (weak, nonatomic) IBOutlet JBLineChartView *lineChartview;
@property (nonatomic,strong) NSMutableArray *timeStamp;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tabs;
@property (weak, nonatomic) IBOutlet UIView *gridView;
@property (weak, nonatomic) IBOutlet UILabel *todayousaved;
@property (weak, nonatomic) IBOutlet DLPieChart *piechartberkeley;
@property (weak, nonatomic) IBOutlet UIView *piechartview;
@property (weak, nonatomic) IBOutlet DLPieChart *piechartcal;
@property (weak, nonatomic) IBOutlet UIView *circ1;
@property (weak, nonatomic) IBOutlet UIView *circ2;
@property (weak, nonatomic) IBOutlet UILabel *berkperc;
@property (weak, nonatomic) IBOutlet UILabel *calperc;
@property (nonatomic,strong) NSMutableArray *duration;
@property (nonatomic,strong) NSMutableArray *berkeleyusers;
@property (nonatomic,strong) NSMutableArray *calusers;
@property (nonatomic,strong) NSMutableArray *weekdata;
@property (nonatomic,strong) NSMutableArray *monthdata;
@property (nonatomic,strong) NSMutableArray *labelviews;
@end
