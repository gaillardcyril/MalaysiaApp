//
//  AppDelegate.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 17/10/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
