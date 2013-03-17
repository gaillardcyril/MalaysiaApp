//
//  RestaurantsListViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 18/10/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantsListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UILabel*pageTitle;
    NSArray*restaurantsInfo;
    bool blinkStatus;
    UILabel*specialOffer;
    
}
@property(strong,nonatomic) IBOutlet UILabel*pageTitle;
@end
