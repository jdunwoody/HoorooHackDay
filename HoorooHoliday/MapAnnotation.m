//
//  MapAnnotations.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation
@synthesize coordinate;
@synthesize tag;
@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c withTag:(NSUInteger)t withTitle:(NSString *)tl withSubtitle:	(NSString *)s
{
	if(self = [super init])
	{
		coordinate = c;
		tag = t;
		title = tl;
		subtitle = s == (id)[NSNull null] ? @"" : s;
        NSLog(@"%f %f %u %@ %@", coordinate.latitude , coordinate.longitude, tag, title, subtitle);
	}
	return self;
    
}

@end