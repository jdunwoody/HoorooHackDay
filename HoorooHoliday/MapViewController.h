//
//  MapViewController.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MKMapView.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,retain) NSMutableArray *annotations;
@property(strong, nonatomic) NSArray *allLocations;
@property (weak, nonatomic) IBOutlet UIScrollView *chosenLocationsView;
@property(strong, nonatomic) NSMutableArray *chosenLocations;
@property (weak, nonatomic) IBOutlet UIButton *quizButton;
@property(strong, nonatomic) NSString *bookingId;
@property (weak, nonatomic) IBOutlet UILabel *instructions;

@end
