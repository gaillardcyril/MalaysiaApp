//
//  ContactViewController.m
//  MYInMelb
//
//  Created by Cyril Gaillard on 20/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import "ContactViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ContactViewController ()

@end

@implementation ContactViewController
@synthesize pageTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setUpMailAccount {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"System Error" message:@"Please setup a mail account first." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	[alert show];
}

// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayComposerSheet {
    NSLog(@"try to push");
	if(![MFMailComposeViewController canSendMail]) {
		[self setUpMailAccount];
		return;
	}
    
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
    [picker setToRecipients:[NSArray arrayWithObject:@"info@melvia.com.au"]];
	[self presentViewController:picker animated:YES completion:nil];
    
}

// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			break;
		case MFMailComposeResultSaved:
			break;
		case MFMailComposeResultSent:
			break;
		case MFMailComposeResultFailed:
			break;
		default:{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email" message:@"Sending Failed - Unknown Error :-(" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[alert show];
		}
			break;
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}
-(void)try{
    NSLog(@"try to push");
}

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
	NSArray *urlComponents = [[[inRequest URL] absoluteString] componentsSeparatedByString:@"/"];
	NSString* urlRequested =  [urlComponents lastObject];
	if ([urlRequested isEqual:@"JJContact.html"])
        return YES;
    
    [[UIApplication sharedApplication] openURL:[inRequest URL]];
    return NO;
}

- (void)viewDidLoad
{
    pageTitle.text=@"Contact";
    pageTitle.font = [UIFont fontWithName:@"LaurenScript" size:25];
    
    aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 60, 320, 225)];//init and create the UIWebView
	
	aWebView.autoresizesSubviews = YES;
	aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	aWebView.scrollView.scrollEnabled=NO;
	aWebView.opaque=NO;
	aWebView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:207.0/255.0 alpha:0.60];
	
	//set the web view delegates for the web view to be itself
	[aWebView setDelegate:self];
	
	
	//NSLog(@"title page %@",webPageName);
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"JJContact" ofType:@"html"]];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//load the URL into the web view.
	[aWebView loadRequest:requestObj];
    
    //add the web view to the content view
	[self.view addSubview:aWebView];

    
    //-------------Display Back Button---------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 250, 320, 50)];
    [button addTarget:self
               action:@selector(displayComposerSheet)
     forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];
    //button.layer.cornerRadius=15;
    button.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:207.0/255.0 alpha:1];
    label.textAlignment=UITextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:@"Send me a message!"];
    [label setTextColor:[UIColor colorWithRed:43.0/255.0 green:26.0/255.0 blue:25.0/255.0 alpha:1]];
    label.backgroundColor=[UIColor clearColor];
    [button addSubview:label];
    [self.view addSubview:button];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
