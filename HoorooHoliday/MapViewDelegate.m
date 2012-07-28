//
//  MapViewDelegate.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "MapViewDelegate.h"
#import "MapAnnotations.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"

@implementation MapViewDelegate

@synthesize mapView;
@synthesize busStopAnnotations;

- (id) initWithMapView: (MKMapView *)newMapView
{
    if (self = [super init]) {
        self.mapView = newMapView;
        
        NSArray *locations = [LocationService getJsonFromServer];
        
        CLLocationCoordinate2D center;
        center.latitude = 42.34203;
        center.longitude = -71.08611;
        
        //declare span of map (height and width in degrees)
        MKCoordinateSpan span;
        span.latitudeDelta = .02;
        span.longitudeDelta = .01;
        
        //add center and span to a region,
        //adjust the region to fit in the mapview
        //and assign to mapview region
        MKCoordinateRegion region; 
        region.center = center;
        region.span = span;
        mapView.region = [mapView regionThatFits:region];
        
        //create annotations and add to the busStopAnnotations array
        NSMutableArray *myArray = [[NSMutableArray alloc] init];
        self.busStopAnnotations = myArray;
        NSUInteger tag;
        CLLocationCoordinate2D annotationCenter;
        MapAnnotations *annotation;
        
        tag = 1;
        annotationCenter.latitude = 42.34203;
        annotationCenter.longitude =  -71.08611;
        //the init function is programmer written to add various information to the annotation object
        annotation = [[MapAnnotations alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:@"MapCenter" withSubtitle:@"Inbound"];
        [self.busStopAnnotations addObject:annotation];
        
        tag = 2;
        annotationCenter.latitude = 42.349120;
        annotationCenter.longitude =  -71.100338;
        annotation = [[MapAnnotations alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:@"Blanford St" withSubtitle:@"Inbound"];
        [self.busStopAnnotations addObject:annotation];
        
        tag = 3;
        annotationCenter.latitude = 42.342562;
        annotationCenter.longitude =  -71.084730;
        annotation = [[MapAnnotations alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:@"Huntington" withSubtitle:@"Inbound"];
        [self.busStopAnnotations addObject:annotation];
        
        tag = 4;
        annotationCenter.latitude = 42.335083;
        annotationCenter.longitude =  -71.071212;
        annotation = [[MapAnnotations alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:@"Albany" withSubtitle:@"Inbound"];
        [self.busStopAnnotations addObject:annotation];
        
        //add annotations array to the mapView
        [mapView addAnnotations:self.busStopAnnotations];

    }
    return self;

}

//this is the required method implementation for MKMapView annotations
- (MKAnnotationView *) mapView:(MKMapView *)thisMapView viewForAnnotation:(MapAnnotations *)annotation
{
	
	//the annotation view objects act like cells in a tableview.  When off screen,
	//they are added to a queue waiting to be reused.  This code mirrors that for
	//getting a table cell.  First check if the queue has available annotation views
	//of the right type, identified by the identifier string.  If nil is returned,
	//then allocate a new annotation view.
	
	static NSString *busStopViewIdentifier = @"BusStopViewIdentifier";
    
    //the result of the call is being cast (MKPinAnnotationView *) to the correct
    //view class or else the compiler complains
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[thisMapView
                                                                  dequeueReusableAnnotationViewWithIdentifier:busStopViewIdentifier];
	if(annotationView == nil)
	{
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:busStopViewIdentifier];
	}
	
	//I choose to color all the annotations green, except for the one with tag == 4
	if((annotation).tag == 4) annotationView.pinColor = MKPinAnnotationColorRed;
	else annotationView.pinColor = MKPinAnnotationColorGreen;
    
    //pin drops when it first appears
    annotationView.animatesDrop=TRUE;
    
    //tapping the pin produces a gray box which shows title and subtitle
    annotationView.canShowCallout = YES;
    
    return annotationView;
}

@end
