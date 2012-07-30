//
//  Location.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

//- (id) initWithX1: x1 withX2: x2 withY1: y1 withY2: y2;

@property(nonatomic,retain) NSNumber *x1, *x2, *y1, *y2;
@property(nonatomic,retain) NSString *title, *imageFilePath;
@end
