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
@property (weak, nonatomic) IBOutlet UILabel *total;

@property (strong, nonatomic) Quiz *quiz;
@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic) NSArray *quizes;
@property (strong, nonatomic) NSNumber *quizNumber;
@property (weak, nonatomic) IBOutlet UIImageView *quizLocationImage;
@property (weak, nonatomic) IBOutlet UIButton *nextQuizButton;

- (IBAction)finishedWithQuiz:(id)sender;

@end
