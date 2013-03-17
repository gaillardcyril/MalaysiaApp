//
//  NonRestaurantListVC.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NonRestaurantListVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UILabel*pageTitle;
    NSString*plistName;
    NSString*pageLblTitle;
    NSArray*nonRestoInfo;
    
}
@property(strong,nonatomic) IBOutlet UILabel*pageTitle;
@property(strong,nonatomic) IBOutlet NSString*plistName;
@property(strong,nonatomic) IBOutlet NSString*pageLblTitle;
@end

