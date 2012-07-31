//
//  Quiz.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "Location.h"

@interface Quiz : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subTitle;
@property (strong, nonatomic) NSMutableArray *questions;
@property (strong, nonatomic) Location *location;


- (int) total;

@end
