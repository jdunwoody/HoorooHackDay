//
//  Quiz.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Quiz : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSMutableArray *questions;

@end
