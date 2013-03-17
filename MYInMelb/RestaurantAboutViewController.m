//
//  RestaurantAboutViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 5/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "RestaurantAboutViewController.h"

@interface RestaurantAboutViewController ()

@end

@implementation RestaurantAboutViewController
@synthesize pageTitle,restoAbout,restoIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goBackOnePage{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"];
    NSArray*restaurantsInfo = [NSArray arrayWithContentsOfFile:plistPath];
    NSDictionary*restoInfo = [restaurantsInfo objectAtIndex:[restoIndex integerValue]];
    
    pageTitle.text=@"About";
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:25];
    
    restoAbout.text=[restoInfo objectForKey:@"Description"];
    restoAbout.font=[UIFont fontWithName:@"MyriadPro-LightCond" size:20];
    
    //-------------Display Back Button---------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button addTarget:self
               action:@selector(goBackOnePage)
     forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];
    label.textAlignment=UITextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:@"Close"];
    [label setTextColor:[UIColor colorWithRed:43.0/255.0 green:26.0/255.0 blue:25.0/255.0 alpha:1]];
    label.backgroundColor=[UIColor clearColor];
    [button addSubview:label];
    [self.view addSubview:button];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
