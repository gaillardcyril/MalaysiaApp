//
//  RestoInfoViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 16/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "RestoInfoViewController.h"

@interface RestoInfoViewController ()

@end

@implementation RestoInfoViewController
@synthesize plistName,venueIndex;

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
    //--------------Load venue informatio
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray*venuesArr = [NSArray arrayWithContentsOfFile:plistPath];
    
    venueInfo = [venuesArr objectAtIndex:[venueIndex integerValue]];
    
    //---------------Set the title of the page
    pageTitle.text=[venueInfo objectForKey:@"Name"];
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:18];
    //-------------Display Back Button---------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button addTarget:self
               action:@selector(goBackOnePage)
     forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];
    label.textAlignment=UITextAlignmentLeft;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:@"Close"];
    [label setTextColor:[UIColor colorWithRed:43.0/255.0 green:26.0/255.0 blue:25.0/255.0 alpha:1]];
    label.backgroundColor=[UIColor clearColor];
    [button addSubview:label];
    [self.view addSubview:button];
    
    //Display the map where the venue will be displayed
    
    //--------------Add the map--------------------//
    libraryMapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 60, 320, 250)];
    
    [self.view addSubview:libraryMapView];
    libraryMapView.delegate=self;
    libraryCoord.latitude =  [[venueInfo objectForKey:@"Latitude"] doubleValue];
    libraryCoord.longitude =  [[venueInfo objectForKey:@"Longitude"] doubleValue];
    
	MKCoordinateSpan span = {.latitudeDelta =  0.002, .longitudeDelta =  0.002};
	MKCoordinateRegion region = {libraryCoord, span};
	
    //--------------Display the marker on the map--------------------//
	VenueMapMarker * venueMapMaker = [[VenueMapMarker alloc]initWithName:[venueInfo objectForKey:@"Name"] address:[venueInfo objectForKey:@"Address"] coordinate:libraryCoord];
 
	[libraryMapView addAnnotation:venueMapMaker];
	[libraryMapView setRegion:region animated:TRUE];
    libraryMapView.showsUserLocation=YES;
    [libraryMapView selectAnnotation:venueMapMaker animated:YES];

    //Display the webview to load all the information about the venue
    aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 310, 320, 235)];
	aWebView.autoresizesSubviews = YES;
	aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	aWebView.scrollView.scrollEnabled=NO;
	aWebView.opaque=NO;
	aWebView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:207.0/255.0 alpha:0.60];
	//set the web view delegates for the web view to be itself
	[aWebView setDelegate:self];
    
//	/NSString
	//load the URL into the web view.
	//[aWebView loadRequest:requestObj];
    NSString*htmlStr = @"";
    NSString*venueAddress = [NSString stringWithFormat:@"<div style=\"font-family:MyriadPro-LightCond, Georgia;\"><span style=\"font-weight:bold;\">Address:</span> %@</div>",[venueInfo objectForKey:@"Address"]];
    if (![[venueInfo objectForKey:@"Address"] isEqualToString:@""]) {
        htmlStr = [htmlStr stringByAppendingString:venueAddress];
    }
    NSString *venuePhone = [NSString stringWithFormat:@"<div style=\"font-family:MyriadPro-LightCond, Georgia;\"><span style=\"font-weight:bold;\">Phone Number:</span> %@</div>",[venueInfo objectForKey:@"Phone"]];
    if (![[venueInfo objectForKey:@"Phone"] isEqualToString:@""]) {
        htmlStr = [htmlStr stringByAppendingString:venuePhone];
    }
    [aWebView loadHTMLString:htmlStr baseURL:nil];
    
    [self.view addSubview:aWebView];
        
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
