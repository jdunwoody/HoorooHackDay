//
//  MapViewDelegate.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "MapViewDelegate.h"
#import "MapAnnotation.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"
#import "Location.h"

@implementation MapViewDelegate

@synthesize mapView;
@synthesize busStopAnnotations;

- (id) initWithMapView: (MKMapView *)newMapView
{
    if (self = [super init]) {
        self.mapView = newMapView;
        
        CLLocationCoordinate2D center;
        center.latitude = -23.07;
        center.longitude =132.08;
        
        //        23 degrees 7 minutes south latitude, 132 degrees 8 minutes east longitude
        
        //declare span of map (height and width in degrees)
        MKCoordinateSpan span;
        span.latitudeDelta = 13;
        span.longitudeDelta = 13;
        
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
        
        NSUInteger tag = 1;
        CLLocationCoordinate2D annotationCenter;
        MapAnnotation *annotation;
        
        NSArray *locations = [LocationService loadLocationsFromLocalJson];
        
        for(Location *location in locations) {
            
            annotationCenter.latitude = [location.x1 doubleValue];
            annotationCenter.longitude =  [location.y1 doubleValue];
            //the init function is programmer written to add various information to the annotation object
            annotation = [[MapAnnotation alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:location.title withSubtitle:location.imageFilePath];
            
            annotation.location = location;
            [self.busStopAnnotations addObject:annotation];
            
            tag++;
        }
        
        //add annotations array to the mapView
        [mapView addAnnotations:self.busStopAnnotations];
        
    }
    return self;
    
}

////this is the required method implementation for MKMapView annotations
//- (MKAnnotationView *) mapView:(MKMapView *)thisMapView     viewForAnnotation:(id < MKAnnotation >)annotation
//{
//
//	//the annotation view objects act like cells in a tableview.  When off screen,
//	//they are added to a queue waiting to be reused.  This code mirrors that for
//	//getting a table cell.  First check if the queue has available annotation views
//	//of the right type, identified by the identifier string.  If nil is returned,
//	//then allocate a new annotation view.
//
//	static NSString *busStopViewIdentifier = @"BusStopViewIdentifier";
//
//    //the result of the call is being cast (MKPinAnnotationView *) to the correct
//    //view class or else the compiler complains
//    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[thisMapView
//                                                                  dequeueReusableAnnotationViewWithIdentifier:busStopViewIdentifier];
//	if(annotationView == nil)
//	{
//		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:busStopViewIdentifier];
//	}
//
//    MKAnnotation *an = (MKAnnotation *) annotation;
//
//	//I choose to color all the annotations green, except for the one with tag == 4
//	if((an).tag == 4) {
//        annotationView.pinColor = MKPinAnnotationColorRed;
//	} else {
//        annotationView.pinColor = MKPinAnnotationColorGreen;
//    }
//
//    //pin drops when it first appears
//    annotationView.animatesDrop=TRUE;
//
//    //tapping the pin produces a gray box which shows title and subtitle
//    annotationView.canShowCallout = YES;
//
//    return annotationView;
//}


/// SEE http://cagt.bu.edu/w/images/9/9b/MKMapView_example.txt


//- (MKAnnotationView *) mapView:(MKMapView *)thisMapView     viewForAnnotation:(id < MKAnnotation >)annotation
//{
//    if(annotation == nil)
//    {
//
//    }
//
//}

//- (MKAnnotationView *) mapView:(MKMapView *)thisMapView viewForAnnotation:(MapAnnotations *)annotation
//{
//
//	//the annotation view objects act like cells in a tableview.  When off screen,
//	//they are added to a queue waiting to be reused.  This code mirrors that for
//	//getting a table cell.  First check if the queue has available annotation views
//	//of the right type, identified by the identifier string.  If nil is returned,
//	//then allocate a new annotation view.
//
//	static NSString *busStopViewIdentifier = @"BusStopViewIdentifier";
//
//    //the result of the call is being cast (MKPinAnnotationView *) to the correct
//    //view class or else the compiler complains
//    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[thisMapView
//                                                                  dequeueReusableAnnotationViewWithIdentifier:busStopViewIdentifier];
//	if(annotationView == nil)
//	{
//		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:busStopViewIdentifier];
//	}
//
//	//I choose to color all the annotations green, except for the one with tag == 4
//	if(((MKAnnotation)annotation).tag == 4) annotationView.pinColor = MKPinAnnotationColorRed;
//	else annotationView.pinColor = MKPinAnnotationColorGreen;
//
//    //pin drops when it first appears
//    annotationView.animatesDrop=TRUE;
//
//    //tapping the pin produces a gray box which shows title and subtitle
//    annotationView.canShowCallout = YES;
//
//    return annotationView;
//}
//

@end
