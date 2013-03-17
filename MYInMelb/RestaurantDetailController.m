//
//  RestaurantDetailController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 18/10/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "RestaurantDetailController.h"
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RestaurantAboutViewController.h"
#import "SharedFunctions.h"
#import "SpecialOfferViewController.h"
#import "RestoInfoViewController.h"

@interface RestaurantDetailController ()

@end

@implementation RestaurantDetailController
@synthesize restoIdx,restaurantName,videoButton,menuButton,infoButton,photosButton,aboutButton,offerButton;


/*-(IBAction)goToInfo:(id)sender{
    CLLocationCoordinate2D endingCoord;
    endingCoord.latitude=-37.810531;
    endingCoord.longitude = -144.965713;
    
    MKPlacemark *endLocation = [[MKPlacemark alloc] initWithCoordinate:endingCoord addressDictionary:nil];
    MKMapItem *endingItem = [[MKMapItem alloc] initWithPlacemark:endLocation];
    
    NSMutableDictionary *launchOptions = [[NSMutableDictionary alloc] init];
    [launchOptions setObject:MKLaunchOptionsDirectionsModeDriving forKey:MKLaunchOptionsDirectionsModeKey];
    
    [endingItem openInMapsWithLaunchOptions:launchOptions];
}*/
/*-(IBAction)goToWeb:(id)sender{
    NSString *webLink = @"http://papparich.net.au/";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:webLink]];
}
-(IBAction)goToFacebook:(id)sender{
    NSString *webLink = @"https://www.facebook.com/PappaRichQV";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:webLink]];
}*/
-(IBAction)displayInfo:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    RestoInfoViewController*infoWithMap = (RestoInfoViewController*)[storyboard instantiateViewControllerWithIdentifier:@"restoInfo"];
    infoWithMap.plistName =@"Restaurants";
    infoWithMap.venueIndex = [NSNumber numberWithInteger:[restoIdx integerValue]];
    [self.navigationController presentModalViewController:infoWithMap animated:YES];
}
-(IBAction)displaSpecialOffer:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    SpecialOfferViewController *speOfferVC = (SpecialOfferViewController *)[storyboard instantiateViewControllerWithIdentifier:@"specialOffer"];

    [self presentModalViewController:speOfferVC animated:YES];
}

-(IBAction)displayAbout:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    RestaurantAboutViewController *restoAboutVC = (RestaurantAboutViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RestoAbout"];
    restoAboutVC.restoIndex=restoIdx;
    [self presentModalViewController:restoAboutVC animated:YES];
}

-(void)addLabelToButton:(UIButton*)button withTitle:(NSString*)title locatedInCenter:(BOOL)centered highlighted:(BOOL)highlited{
    
    [[button layer] setBorderWidth:3.0f];
    [[button layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    UILabel *label;
    if (centered)
        label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];
    else
        label = [[UILabel alloc] initWithFrame:CGRectMake(0,107,button.frame.size.width,35)];
    
    label.textAlignment=UITextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:title];
    [label setTextColor:[UIColor colorWithRed:43.0/255.0 green:26.0/255.0 blue:25.0/255.0 alpha:1]];
    label.backgroundColor=[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:207.0/255.0 alpha:1];
    if (highlited) {
        [label setTextColor:[UIColor redColor]];
    }
    [button addSubview:label];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goBackOnePage{
    [self.navigationController popViewControllerAnimated:YES];
}

/*- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}*/
-(IBAction)displayVideo:(id)sender{
    // Play movie from the bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jj" ofType:@"mp4" inDirectory:nil];
     CustomMoviePlayerViewController  *moviePlayer; moviePlayer = [[CustomMoviePlayerViewController alloc] initWithPath:path];
     // Show the movie player as modal
     [self presentModalViewController:moviePlayer animated:YES];
     // Prep and play the movie
     [moviePlayer readyPlayer];

}

-(IBAction)showImageGallery:(id)sender{
    NSInteger buttonTag =  [sender tag];
    photos = [NSMutableArray array];
    
    if (buttonTag==103) {
        NSInteger numberPhotosMenu = [[restoInfo objectForKey:@"NumberPhotos"] integerValue];
        
        for (NSInteger i=0; i<numberPhotosMenu; i++) {
            NSString *extension = [NSString stringWithFormat:@"Photo%02d",i];
            NSString*photo = [[restoInfo objectForKey:@"baseName"]stringByAppendingString:extension];
            NSLog(@"Photo name:%@",photo);
            [photos addObject:[MWPhoto photoWithFilePath:[[NSBundle mainBundle] pathForResource:photo ofType:@"jpg"]]];
        }
    }
    else if(buttonTag==101){
        NSInteger numberPhotosMenu = [[restoInfo objectForKey:@"NumberMenuPhotos"] integerValue];
        
        for (NSInteger i=0; i<numberPhotosMenu; i++) {
        NSString *extension = [NSString stringWithFormat:@"Menu%02d",i];
        NSString*photo = [[restoInfo objectForKey:@"baseName"]stringByAppendingString:extension];
        NSLog(@"Photo name:%@",photo);
        [photos addObject:[MWPhoto photoWithFilePath:[[NSBundle mainBundle] pathForResource:photo ofType:@"jpg"]]];
        }
    }
    
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    // Set options
    browser.wantsFullScreenLayout = NO; // Decide if you want the photo browser full screen, i.e. whether the status bar is affected (defaults to YES)
    browser.displayActionButton = NO; // Show action button to save, copy or email photos (defaults to NO)
    [browser setInitialPageIndex:0]; // Example: allows second image to be presented first
    // Present
    //self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController:browser animated:YES];
    
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return [photos count];
}

- (MWPhoto *)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < [photos count])
        return [photos objectAtIndex:index];
    return nil;
}

- (void)viewDidLoad
{
    //----------Load all restaurants Info
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"];
    NSArray*restaurantsInfo = [NSArray arrayWithContentsOfFile:plistPath];
    restoInfo = [restaurantsInfo objectAtIndex:[restoIdx integerValue]];
    restaurantName.text=[restoInfo objectForKey:@"Name"];
    restaurantName.font = [UIFont fontWithName:@"LaurenScript" size:25];    
    aboutButton.titleLabel.font = [UIFont fontWithName:@"LaurenScript" size:20];
    [self addLabelToButton:aboutButton withTitle:@"About" locatedInCenter:YES highlighted:NO];

    NSString*baseName = [restoInfo objectForKey:@"baseName"];
    
    videoButton.titleLabel.font = [UIFont fontWithName:@"LaurenScript" size:20];
    [self addLabelToButton:videoButton withTitle:@"Video" locatedInCenter:NO highlighted:NO];
    
    [videoButton setBackgroundImage:[UIImage imageNamed:@"julietVideo.jpg"] forState:UIControlStateNormal];
        
    NSString*menuThumb = [NSString stringWithFormat:@"%@MenuThumb.jpg",baseName];
    menuButton.titleLabel.font = [UIFont fontWithName:@"LaurenScript" size:20];
    [menuButton setBackgroundImage:[UIImage imageNamed:menuThumb] forState:UIControlStateNormal];
    [self addLabelToButton:menuButton withTitle:@"Menu" locatedInCenter:NO highlighted:NO];
    
    
    infoButton.titleLabel.font = [UIFont fontWithName:@"LaurenScript" size:20];
    [infoButton setBackgroundImage:[UIImage imageNamed:@"melbourneMap.png"] forState:UIControlStateNormal];
    [self addLabelToButton:infoButton withTitle:@"Info" locatedInCenter:NO highlighted:NO];
    
    photosButton.titleLabel.font = [UIFont fontWithName:@"LaurenScript" size:20];
    [self addLabelToButton:photosButton withTitle:@"Photos" locatedInCenter:NO highlighted:NO];
    
    NSString*photoThumb = [NSString stringWithFormat:@"%@PhotoThumb.jpg",baseName];
    [photosButton setBackgroundImage:[UIImage imageNamed:photoThumb] forState:UIControlStateNormal];
    
    offerButton.titleLabel.font = [UIFont fontWithName:@"LaurenScript" size:20];
    [self addLabelToButton:offerButton withTitle:@"Special Offer" locatedInCenter:YES highlighted:YES];
    
    //addBackButton(self);
    //----------------Add Back Button---------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 50, 50)];
    [button addTarget:self
               action:@selector(goBackOnePage)
     forControlEvents:UIControlEventTouchUpInside];    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];    
    label.textAlignment=UITextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:@"Back"];
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
