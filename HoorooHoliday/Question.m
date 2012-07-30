//
//  Question.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize text;
@synthesize answered = _answered;

- (id) init
{
    if (self = [super init]) {
        self.answered = NO;
    }
    
    return self;
}

@end
