//
//  Pin.m
//  Locations
//
//  Created by oussama on 26/10/2016.
//  Copyright © 2016 nice. All rights reserved.
//

#import "Pin.h"

@implementation Pin

- (id)initWithCoordinate:(CLLocationCoordinate2D)newCoordinate {
    
    self = [super init];
    if (self) {
        _coordinate = newCoordinate;
        _title = @"Bonjur";
        _subtitle = @"vous étes là?";
    }
    return self;
}

@end
