//
//  QuestionCell.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestionCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *text;
@property (nonatomic, strong) Question *question;

@end
