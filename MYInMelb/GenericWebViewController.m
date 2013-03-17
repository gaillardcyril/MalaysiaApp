//
//  GenericWebViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "GenericWebViewController.h"

@interface GenericWebViewController ()

@end

@implementation GenericWebViewController
@synthesize pageTitle,pageLblTitle,webPageTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goBackOnePage{
    [self.navigationController popViewControllerAnimated:YES];
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
    pageTitle.text=pageLblTitle;
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:20];
    
    aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(15, 60, 290, 425)];//init and create the UIWebView
	
	aWebView.autoresizesSubviews = YES;
	aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
	aWebView.opaque=NO;
	aWebView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:207.0/255.0 alpha:0.60];
	
	//set the web view delegates for the web view to be itself
	[aWebView setDelegate:self];
	
	
	//NSLog(@"title page %@",webPageName);
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:webPageTitle ofType:@"html"]];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//load the URL into the web view.
	[aWebView loadRequest:requestObj];
	
    //-------------Display Back Button---------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 50, 50)];
    [button addTarget:self
               action:@selector(goBackOnePage)
     forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];
    label.textAlignment=UITextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:@"Back"];
    [label setTextColor:[UIColor colorWithRed:43.0/255.0 green:26.0/255.0 blue:25.0/255.0 alpha:1]];
    label.backgroundColor=[UIColor clearColor];
    [button addSubview:label];
    [self.view addSubview:button];
    
    
	//add the web view to the content view
	[self.view addSubview:aWebView];
	

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
