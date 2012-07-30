//
//  Quiz.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

@synthesize title, subTitle, questions;

- (id) init
{
    if (self = [super init]) {
        self.questions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (int) total
{
    int total = 0;
    for(Question *question in questions) {
        if (question.answered) {
            total++;
        }
    }
    
    return total;
}

@end

