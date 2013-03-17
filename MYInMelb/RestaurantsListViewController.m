//
//  RestaurantsListViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 18/10/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "RestaurantsListViewController.h"
#import "RestaurantDetailController.h"
#import "NonRestaurantListVC.h"

@interface RestaurantsListViewController ()

@end

@implementation RestaurantsListViewController


@synthesize pageTitle;
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [restaurantsInfo count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RestaurantsListCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //------------Setting the image------------
    UIImageView *restaurantThumb = (UIImageView *)
    [cell viewWithTag:102];
    restaurantThumb.image = [UIImage imageNamed:[[restaurantsInfo objectAtIndex:indexPath.row] objectForKey:@"ThumbPhoto"] ];
    //--------Setting the Name of the restaurant------------
    UILabel*restaurantName =(UILabel*)[cell viewWithTag:100];
    restaurantName.text=[[restaurantsInfo objectAtIndex:indexPath.row] objectForKey:@"Name"];
    restaurantName.font = [UIFont fontWithName:@"LaurenScript" size:17];
    //------Setting the Location of the restaurant------------
    UILabel*restaurantLocation =(UILabel*)[cell viewWithTag:101];
    restaurantLocation.font=[UIFont fontWithName:@"MyriadPro-LightCond" size:15];
    restaurantLocation.text=[[restaurantsInfo objectAtIndex:indexPath.row] objectForKey:@"Location"];
    
    //------Setting the Blurb of the restaurant------------
    UILabel*restaurantBlurb =(UILabel*)[cell viewWithTag:103];
    restaurantBlurb.font=[UIFont fontWithName:@"MyriadPro-LightCond" size:15];
    restaurantBlurb.text=[[restaurantsInfo objectAtIndex:indexPath.row] objectForKey:@"Blurb"];
    
    if (indexPath.row==1) {
        //--Setting the Special Offer------------
        specialOffer =(UILabel*)[cell viewWithTag:104];
        specialOffer.font=[UIFont fontWithName:@"LaurenScript" size:15];
        specialOffer.textColor =[UIColor redColor];
        specialOffer.text=@"Offer";
        
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    	
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
        RestaurantDetailController *restoDetailVC = (RestaurantDetailController *)[storyboard instantiateViewControllerWithIdentifier:@"restoDetail"];
        restoDetailVC.restoIdx=[NSNumber numberWithInt:indexPath.row];
        [self.navigationController pushViewController:restoDetailVC animated:YES];
    
}

- (void)goBackOnePage{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)blink{
    if(blinkStatus == FALSE){
        specialOffer.textColor=[UIColor clearColor];
        blinkStatus = TRUE;
    }else {
        specialOffer.textColor=[UIColor redColor];
        blinkStatus = FALSE;
    }
}
- (void)viewDidLoad
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"];
    restaurantsInfo = [NSArray arrayWithContentsOfFile:plistPath];
    
    pageTitle.text=@"Restaurants";
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:25];
    
    
    //-------------Display Back Button---------
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
    
    [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)(0.5)  target:self selector:@selector(blink) userInfo:nil repeats:TRUE];
    blinkStatus = FALSE;

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
