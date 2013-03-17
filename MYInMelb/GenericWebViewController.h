//
//  GenericWebViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenericWebViewController : UIViewController<UIWebViewDelegate>{
IBOutlet UILabel*pageTitle;
    UIWebView* aWebView;
    NSString*pageLblTitle;
    NSString*webPageTitle;
}
@property(strong,nonatomic) IBOutlet UILabel*pageTitle;
@property(strong,nonatomic) NSString*pageLblTitle;
@property(strong,nonatomic) NSString*webPageTitle;
@end
