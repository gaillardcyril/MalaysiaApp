//
//  AboutViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "AboutViewController.h"
#import "GenericWebViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize pageTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AboutListCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //--------Setting the Name of the restaurant------------
    UILabel*messageName =(UILabel*)[cell viewWithTag:100];
    
    messageName.font = [UIFont fontWithName:@"LaurenScript" size:17];
    
    if (indexPath.row==2) {
        messageName.text=@" Juliet John's message";
    }
    else if(indexPath.row==0){
        messageName.text=@" Lord Mayor's message";
    }
    else if(indexPath.row==1){
        messageName.text=@" Consul General's message";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    GenericWebViewController *jjMessage = (GenericWebViewController *)[storyboard instantiateViewControllerWithIdentifier:@"webViewNib"];

    if (indexPath.row==2) {
        jjMessage.pageLblTitle=@"Juliet John";
        jjMessage.webPageTitle=@"JJMsg";
    }
    else if(indexPath.row==0){
        jjMessage.pageLblTitle=@"Robert Doyle";
        jjMessage.webPageTitle=@"RBMsg";
    }
    else if(indexPath.row==1 ){
        jjMessage.pageLblTitle=@"Consul General";
        jjMessage.webPageTitle=@"DRMsg";
    }
    
	/*[directorMessage initWithPageTitle:@"Director Message"];
	[directorMessage initWithWebPage:@"RocioMsg"];*/
	[self.navigationController pushViewController:jjMessage animated:YES];

}

- (void)viewDidLoad
{
    pageTitle.text=@"About";
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:25];
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
