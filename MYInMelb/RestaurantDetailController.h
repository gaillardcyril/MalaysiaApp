//
//  RestaurantDetailController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 18/10/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWPhotoBrowser.h"
#import "CustomMoviePlayerViewController.h"

@interface RestaurantDetailController : UIViewController<MWPhotoBrowserDelegate>{
    
    NSNumber*restoIdx;
    IBOutlet UILabel *restaurantName;
    NSMutableArray*photos;
    IBOutlet UIButton*aboutButton;
    IBOutlet UIButton*videoButton;
    IBOutlet UIButton*menuButton;
    IBOutlet UIButton*infoButton;
    IBOutlet UIButton*photosButton;
    IBOutlet UIButton*offerButton;
    NSDictionary*restoInfo;

}
-(IBAction)showImageGallery:(id)sender;
-(IBAction)displayAbout:(id)sender;
-(IBAction)displaSpecialOffer:(id)sender;
-(IBAction)displayInfo:(id)sender;
-(IBAction)displayVideo:(id)sender;

@property(strong,nonatomic) NSNumber*restoIdx;
@property(strong,nonatomic) IBOutlet UILabel *restaurantName;
@property(strong,nonatomic) IBOutlet UIButton*videoButton;
@property(strong,nonatomic) IBOutlet UIButton*aboutButton;
@property(strong,nonatomic) IBOutlet UIButton*menuButton;
@property(strong,nonatomic) IBOutlet UIButton*infoButton;
@property(strong,nonatomic) IBOutlet UIButton*photosButton;
@property(strong,nonatomic) IBOutlet UIButton*offerButton;
@end
