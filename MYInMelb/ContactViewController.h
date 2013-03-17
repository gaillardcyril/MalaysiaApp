//
//  ContactViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface ContactViewController : UIViewController<UIWebViewDelegate,MFMailComposeViewControllerDelegate>
{
    IBOutlet UILabel*pageTitle;
    UIWebView* aWebView;
}
@property(strong,nonatomic) IBOutlet UILabel*pageTitle;
@end
