//
//  MapViewDelegate.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewDelegate : NSObject<MKMapViewDelegate>

- (id) initWithMapView: (MKMapView *)newMapView;

@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,retain) NSMutableArray *busStopAnnotations;

@end
