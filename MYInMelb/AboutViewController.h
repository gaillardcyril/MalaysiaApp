//
//  AboutViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UILabel*pageTitle;
}
@property(strong,nonatomic) IBOutlet UILabel*pageTitle;
@end
