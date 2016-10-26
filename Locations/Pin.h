//
//  Pin.h
//  Locations
//
//  Created by oussama on 26/10/2016.
//  Copyright © 2016 nice. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Pin : NSObject <MKAnnotation> 

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
