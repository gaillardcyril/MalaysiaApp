//
//  RestaurantAboutViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 5/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantAboutViewController : UIViewController{
    NSNumber*restoIndex;
IBOutlet UILabel*pageTitle;
 IBOutlet UITextView*restoAbout;
}

@property(strong,nonatomic) IBOutlet UILabel*pageTitle;
@property(strong,nonatomic) IBOutlet UITextView*restoAbout;
@property(strong,nonatomic) NSNumber*restoIndex;

@end
