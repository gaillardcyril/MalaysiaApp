//
//  InMelbViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 18/10/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "InMelbViewController.h"
#import "RestaurantsListViewController.h"
#import "NonRestaurantListVC.h"

@interface InMelbViewController ()

@end

@implementation InMelbViewController


- (IBAction)screenSelection:(UIButton*)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    if (sender.tag==100) {
        
        RestaurantsListViewController *myVC = (RestaurantsListViewController *)[storyboard instantiateViewControllerWithIdentifier:@"myViewCont"];
        [self.navigationController pushViewController:myVC animated:YES];
    }
    else{
        NonRestaurantListVC *nonRestoListVC = (NonRestaurantListVC *)[storyboard instantiateViewControllerWithIdentifier:@"NonRestaurantList"];
        if (sender.tag==101){
            nonRestoListVC.plistName=@"Butchers";
            nonRestoListVC.pageLblTitle=@"Butchers";
        }
        else if (sender.tag==102){
            nonRestoListVC.plistName=@"Groceries";
            nonRestoListVC.pageLblTitle=@"Groceries";
        }
        else if (sender.tag==103) {
            nonRestoListVC.plistName=@"GettingHelp";
            nonRestoListVC.pageLblTitle=@"Getting Help";
        }
        [self.navigationController pushViewController:nonRestoListVC animated:YES];
    }
}

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
