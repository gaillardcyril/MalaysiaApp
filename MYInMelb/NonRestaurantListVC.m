//
//  NonRestaurantListVC.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "NonRestaurantListVC.h"
#import "GenericWebViewController.h"
#import "RestoInfoViewController.h"

@interface NonRestaurantListVC ()

@end

@implementation NonRestaurantListVC
@synthesize pageTitle,plistName,pageLblTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nonRestoInfo count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NonRestaurantCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //--------Setting the Name of the restaurant------------
    UILabel*cellTitle =(UILabel*)[cell viewWithTag:100];
    cellTitle.text=[[nonRestoInfo objectAtIndex:indexPath.row] objectForKey:@"Name"];
    cellTitle.font = [UIFont fontWithName:@"LaurenScript" size:17];

    return cell;
}
- (void)goBackOnePage{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    if ([plistName isEqualToString:@"GettingHelp"]) {
        GenericWebViewController *webViewScreen = (GenericWebViewController *)[storyboard instantiateViewControllerWithIdentifier:@"webViewNib"];
        
        if (indexPath.row==1) {
            webViewScreen.pageLblTitle=@"Masca - Victoria";
            webViewScreen.webPageTitle=@"MascaMsg";
        }
        else if(indexPath.row==0){
            webViewScreen.pageLblTitle=@"Victoria Police";
            webViewScreen.webPageTitle=@"VicPolice";
        }
        else if(indexPath.row==2){
            webViewScreen.pageLblTitle=@"Malaysian Consulate";
            webViewScreen.webPageTitle=@"MalaysianConsulate";
        }
        
        [self.navigationController pushViewController:webViewScreen animated:YES];
    }
    
    else {
        RestoInfoViewController*infoWithMap = (RestoInfoViewController*)[storyboard instantiateViewControllerWithIdentifier:@"restoInfo"];
        infoWithMap.plistName =plistName;
        infoWithMap.venueIndex = [NSNumber numberWithInteger:indexPath.row];
        [self.navigationController presentModalViewController:infoWithMap animated:YES];

    }
    
    
}

- (void)viewDidLoad{
    
    pageTitle.text=pageLblTitle;
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:25];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    nonRestoInfo = [NSArray arrayWithContentsOfFile:plistPath];

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
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
