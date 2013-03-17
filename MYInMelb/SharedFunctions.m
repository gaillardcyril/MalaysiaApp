//
//  SharedFunctions.m
//  MooeeMath
//
//  Created by Cyril Gaillard on 3/01/11.
//  Copyright 2011 Voila Design. All rights reserved.
//

#import "SharedFunctions.h"
//#import "AppDelegate.h"

void addBackButton(UIViewController* viewController){
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 50, 50)];
    [button addTarget:viewController
               action:@selector(goBackOnePage)
     forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,button.frame.size.width,button.frame.size.height)];
    label.textAlignment=UITextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"LaurenScript" size:20]];
    [label setText:@"Back"];
    [label setTextColor:[UIColor colorWithRed:43.0/255.0 green:26.0/255.0 blue:25.0/255.0 alpha:1]];
    label.backgroundColor=[UIColor clearColor];
    [button addSubview:label];
    [viewController.view addSubview:button];
}

