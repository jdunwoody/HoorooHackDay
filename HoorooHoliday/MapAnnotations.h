//
//  MapAnnotations.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>

@interface MapAnnotations : NSObject<MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSUInteger tag;
    NSString *title;
    NSString *subtitle;
}

@property(nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic) NSUInteger tag;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;


//programmer provided init function to create the annotation objects
-(id)initWithCoordinate:(CLLocationCoordinate2D)c withTag:(NSUInteger)t withTitle:(NSString *)tl withSubtitle:	(NSString *)s;
@end