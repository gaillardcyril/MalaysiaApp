//
//  RestoInfoViewController.h
//  MYInMelb
//
//  Created by Cyril Gaillard on 16/11/12.
//  Copyright (c) 2012 Cyril Gaillard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "VenueMapMarker.h"

@interface RestoInfoViewController : UIViewController<UIWebViewDelegate,MKMapViewDelegate>{
    
    CLLocationManager *locationManager;
    CLLocationCoordinate2D userLocation;
    MKMapView *libraryMapView;
    CLLocationCoordinate2D libraryCoord;
    IBOutlet UILabel*pageTitle;
    UIWebView *aWebView;
    //IBOutlet  MKMapView *libraryMapView;
    NSString*plistName;
    NSNumber *venueIndex;
    NSDictionary *venueInfo;
    
}
@property(strong,nonatomic) NSString*plistName;
@property(strong,nonatomic) NSNumber *venueIndex;

@end
