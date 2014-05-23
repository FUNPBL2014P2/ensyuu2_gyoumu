//
//  ViewController.m
//  maptest
//
//  Created by Shota Oda on 2014/05/23.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myMapView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MKCoordinateRegion region = myMapView.region;
    region.center.latitude = 41.842011;
    region.center.longitude = 140.766987;
    region.span.latitudeDelta = 0.005;
    region.span.longitudeDelta = 0.005;
    [myMapView setRegion:region animated:YES];
    
    lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    lm.distanceFilter = kCLHeadingFilterNone;
    [lm startUpdatingLocation];
    
    MKPointAnnotation* pin = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D point;
    point.latitude = 41.842011;
    point.longitude = 140.766987;
    [pin setCoordinate:point];
    pin.title = @"公立はこだて未来大学";
    pin.subtitle = @"亀田中野町116番地2";
    [myMapView addAnnotation:pin];
    
    myMapView.delegate = self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    myMapView.showsUserLocation = YES;
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [myMapView
                                                                   dequeueReusableAnnotationViewWithIdentifier:@"my_aanotation"];
    
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"my_annotation"];
    } else {
        annotationView.annotation = annotation;
    }
    
    annotationView.animatesDrop=YES;
    annotationView.canShowCallout=YES;
    annotationView.pinColor=MKPinAnnotationColorPurple;
    annotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
 
    return annotationView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
