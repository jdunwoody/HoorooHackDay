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
#import "ExperienceQuizUIViewController.h"
#import "QuizService.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize instructions, quizButton, chosenLocationsView, bookingId;

@synthesize mapView, allLocations, chosenLocations;

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
    if (self.bookingId == nil) {
        self.instructions.text = @"Choose locations on the map to take a quiz and test your knowledge";
        self.allLocations = [LocationService loadLocationsFromLocalJson];
        
    } else {
        self.instructions.text = @"The locations you have visited before are on the map. Take the quiz.";
        self.allLocations = [LocationService loadLocationsFromBooking: self.bookingId];
    }
    
//    self.allLocations = [[NSMutableArray alloc] init];
    self.chosenLocations = [[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D center;
    center.latitude = -25.373809;
    center.longitude = 131.053161;
    
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
    self.annotations = myArray;
    
    NSUInteger tag = 1;
    CLLocationCoordinate2D annotationCenter;
    MapAnnotation *annotation;
    
    
    for(Location *location in allLocations) {
        
        annotationCenter.latitude = [location.x1 doubleValue];
        annotationCenter.longitude =  [location.y1 doubleValue];
        //the init function is programmer written to add various information to the annotation object
        annotation = [[MapAnnotation alloc] initWithCoordinate:annotationCenter withTag:tag withTitle:location.title withSubtitle:location.imageFilePath];
        annotation.location = location;
        
        [self.annotations addObject:annotation];
        
        tag++;
    }
    
    //add annotations array to the mapView
    [mapView addAnnotations:self.annotations];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setChosenLocationsView:nil];
    [self setQuizButton:nil];
    [self setInstructions:nil];
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

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    MapAnnotation *annotation = view.annotation;
    //    NSString *temp = annotation.title;
    [self addedLocation];
    [self.chosenLocations addObject:annotation.location];
    
    int numberOfImages = [self.chosenLocations count];
    
    //    UIView *cView =[[UIView alloc] initWithFrame:CGRectMake(0, 02, 300, 110)];
    //    cView.backgroundColor=[UIColor whiteColor];
    //
    //    imgView.frame=CGRectMake(5, 15, 100, 80);
    
    
    if (annotation.location.imageFilePath != (id)[NSNull null] &&  annotation.location.imageFilePath.length > 0) {
        UIImage *image = [UIImage imageNamed:annotation.location.imageFilePath];
        
        int width = 224;
        int height = 228;
        
        UIImageView *imgView=[[UIImageView alloc]initWithImage:image];
        int x = (numberOfImages - 1) * width;
        int y = 0;
        
        imgView.frame = CGRectMake(x, y, width, height);
        [self.chosenLocationsView addSubview:imgView];
        self.chosenLocationsView.contentSize = CGSizeMake(width * numberOfImages, height);
        
        
        CGPoint rightOffset = CGPointMake([self.chosenLocationsView contentSize].width - self.chosenLocationsView.frame.size.width, 0);
        
        //        CGPoint rightOffset = CGPointMake(self.chosenDestinations.bounds.size.width - self.chosenDestinations.contentSize.width, 0);
        [self.chosenLocationsView setContentOffset:rightOffset animated:YES];
        
        image = nil;
        imgView = nil;
    }
}

- (void) addedLocation
{
    [self enableQuizButtons];
}

- (void) enableQuizButtons
{
    self.quizButton.enabled = YES;
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"quiz"]) {
        ExperienceQuizUIViewController *quizViewController = (ExperienceQuizUIViewController *)segue.destinationViewController;
        
        quizViewController.quizes = [QuizService loadWithLocations: self.chosenLocations];
        quizViewController.quizNumber = [NSNumber numberWithInt:0];
    }
}


@end
