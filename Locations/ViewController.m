//
//  ViewController.m
//  Locations
//
//  Created by oussama on 26/10/2016.
//  Copyright © 2016 nice. All rights reserved.
//

#import "ViewController.h"
#import "Pin.h"

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startLocations];
    
    // add a long press gesture
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(addPin:)];
    recognizer.minimumPressDuration = 0.2;
    [self.mapView addGestureRecognizer:recognizer];
    
}


#pragma mark - Location Manager

- (CLLocationManager *)manager {
    
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _manager;
}

- (void)startLocations {
    
    [self.manager startUpdatingLocation];
}



#pragma oussama  - Map Kit

- (void)updateMapView:(CLLocation *)location {
    
    // create a region and pass it to the Map View
    MKCoordinateRegion region;
    region.center.latitude = location.coordinate.latitude;
    region.center.longitude = location.coordinate.longitude;
    region.span.latitudeDelta = 0.00001;
    region.span.longitudeDelta = 0.00001;
    
    [self.mapView setRegion:region animated:YES];
    
}

// func pin

- (void)addPin:(UIGestureRecognizer *)recognizer {
    
    if (recognizer.state != UIGestureRecognizerStateBegan) {
        return;
    }
    
    // convert touched position to map coordinate
    
    CGPoint userTouch = [recognizer locationInView:self.mapView];
    CLLocationCoordinate2D mapPoint = [self.mapView convertPoint:userTouch toCoordinateFromView:self.mapView];
    
    // aadd to our view
    Pin *newPin = [[Pin alloc]initWithCoordinate:mapPoint];
    [self.mapView addAnnotation:newPin];
    
}

@end
