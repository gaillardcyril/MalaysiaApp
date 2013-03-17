//
//  TalentCorpViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 12/12/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "TalentCorpViewController.h"

@interface TalentCorpViewController ()

@end

@implementation TalentCorpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
	NSArray *urlComponents = [[[inRequest URL] absoluteString] componentsSeparatedByString:@"/"];
	NSString* urlRequested =  [urlComponents lastObject];
	if ([urlRequested isEqual:@"JJMsg.html"]||[urlRequested isEqual:@"RBMsg.html"]||[urlRequested isEqual:@"MascaMsg.html"]||[urlRequested isEqual:@"VicPolice.html"]||[urlRequested isEqual:@"MalaysianConsulate.html"]||[urlRequested isEqual:@"DRMsg.html"])
        return YES;
    
    [[UIApplication sharedApplication] openURL:[inRequest URL]];
    return NO;
}

- (void)viewDidLoad
{
    
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:25];
    aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(15, 60, 290, 425)];//init and create the UIWebView
	
	aWebView.autoresizesSubviews = YES;
	aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
	aWebView.opaque=NO;
	aWebView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:207.0/255.0 alpha:0.60];
	
	//set the web view delegates for the web view to be itself
	[aWebView setDelegate:self];
	
    //add the web view to the content view
	[self.view addSubview:aWebView];
	
	//NSLog(@"title page %@",webPageName);
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"TalentCorp" ofType:@"html"]];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//load the URL into the web view.
	[aWebView loadRequest:requestObj];

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
