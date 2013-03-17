//
//  TalentCorpViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 12/12/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalentCorpViewController : UIViewController<UIWebViewDelegate>{
    IBOutlet UILabel*pageTitle;
    UIWebView* aWebView;
}

@end
