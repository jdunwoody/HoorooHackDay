//
//  MapAnnotations.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "MapAnnotations.h"

@implementation MapAnnotations
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
		subtitle = s;
	}
	return self;
    
}

@end