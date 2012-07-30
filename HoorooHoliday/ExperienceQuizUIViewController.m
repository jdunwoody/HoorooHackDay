//
//  ExperienceQuizUIViewController.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "ExperienceQuizUIViewController.h"
#import "QuizService.h"
#import "Quiz.h"

@implementation ExperienceQuizUIViewController

- (void) viewDidLoad
{

    Quiz *quiz = [QuizService load];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = quiz.title;
    
    [self.view addSubview:label];
    [super viewDidLoad];

}

@end
