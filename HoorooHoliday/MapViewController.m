//
//  MapViewController.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"
#import <MapKit/MapKit.h>
#import "MapViewDelegate.h"
#import "MapAnnotation.h"
#import "LocationService.h"
#import <MapKit/MKAnnotation.h>

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    CLLocationCoordinate2D center;
    center.latitude = -25.373809;
    center.longitude =131.053161;
    
    //declare span of map (height and width in degrees)
    MKCoordinateSpan span;
    span.latitudeDelta = 32;
    span.longitudeDelta = 32.89;
    
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
        annotation = [[MapAnnotation alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:location.title withSubtitle:location.subtitle];
        [self.busStopAnnotations addObject:annotation];
        
        tag++;
    }
    
    //add annotations array to the mapView
    [mapView addAnnotations:self.busStopAnnotations];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


//this is the required method implementation for MKMapView annotations
- (MKAnnotationView *) mapView:(MKMapView *)thisMapView viewForAnnotation:(id < MKAnnotation >)annotation
{

	//the annotation view objects act like cells in a tableview.  When off screen,
	//they are added to a queue waiting to be reused.  This code mirrors that for
	//getting a table cell.  First check if the queue has available annotation views
	//of the right type, identified by the identifier string.  If nil is returned,
	//then allocate a new annotation view.

	static NSString *busStopViewIdentifier = @"BusStopViewIdentifier";

    //the result of the call is being cast (MKPinAnnotationView *) to the correct
    //view class or else the compiler complains
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[thisMapView dequeueReusableAnnotationViewWithIdentifier:busStopViewIdentifier];
	if(annotationView == nil)
	{
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:busStopViewIdentifier];
	}

//    MKAnnotation *an = (MKAnnotation *) annotation;

//	//I choose to color all the annotations green, except for the one with tag == 4
//	if(annotation.tag == 4) {
//        annotationView.pinColor = MKPinAnnotationColorRed;
//	} else {
        annotationView.pinColor = MKPinAnnotationColorGreen;
//    }

    //pin drops when it first appears
    annotationView.animatesDrop=TRUE;

    //tapping the pin produces a gray box which shows title and subtitle
    annotationView.canShowCallout = YES;

    return annotationView;
}



//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"mapView"]) {
        //        AddTypeViewController *destination = (AddTypeViewController *)segue.destinationViewController;
        //
        //        destination.addExerciseViewControllerDelegate = self;
        //
        //        //        PickerTestViewController *asker = (PickerTestViewController *) segue.destinationViewController;
        //        //        asker.delegate = self;
        //        //        asker.question = @"What do you want your label to say?";
        //        asker.answer = @"Label text";
//    }
//}

@end
