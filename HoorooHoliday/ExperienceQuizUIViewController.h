//
//  ExperienceQuizUIViewController.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "quiz.h"

@interface ExperienceQuizUIViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *quizTitle;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UIView *questionContainer;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Quiz *quiz;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end
