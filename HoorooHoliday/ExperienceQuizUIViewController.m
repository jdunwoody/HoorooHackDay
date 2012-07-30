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
#import "QuestionCell.h"

@implementation ExperienceQuizUIViewController
@synthesize quizTitle;
@synthesize subtitle;
@synthesize questionContainer;
@synthesize tableView;
@synthesize title;
@synthesize quiz;

- (void) viewDidLoad
{
    self.quiz = [QuizService load];
    
    self.quizTitle.text = quiz.title;
    self.subtitle.text = quiz.subTitle;
    
//    UIView *previousLabel = nil;
//    
//    //    UIFont *font = [UIFont fontWithName:@"System" size:17];
//    UIFont *font = [UIFont systemFontOfSize:17];
//    
//    for (Question *question in quiz.questions) {
//        CGRect viewRect;
//        
//        //        CGSize constraintSize = CGSizeMake(300.0f, MAXFLOAT);
//        //        CGSize labelSize = [question.text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//        CGSize labelSize = CGSizeMake(700, 80);
//        
//        if (previousLabel) {
//            viewRect = CGRectMake(previousLabel.frame.origin.x,
//                                  previousLabel.frame.origin.y + previousLabel.frame.size.height, labelSize.width, labelSize.height);
//        } else {
//            viewRect = CGRectMake(20, 20, labelSize.width, labelSize.height);
//        }
//        
//        
//        UILabel *label = [[UILabel alloc] initWithFrame : viewRect];
//        
//        //        [label setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
//        label.autoresizingMask =UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//        label.numberOfLines = 0;
//        label.text = question.text;
//        
//        [self.questionContainer addSubview: label];
//        previousLabel = label;
//        label = nil;
//    }
//    font = nil;
    
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [self setTitle:nil];
    [self setQuizTitle:nil];
    [self setSubtitle:nil];
    [self setQuestionContainer:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.quiz.questions count];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"title for header in section";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Question *question = [self.quiz.questions objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"QuestionCell";
    QuestionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.question = question;
    
    if (cell.question.answeredYes) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [cell.text setText: question.text];
       
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    Question *question = [self.quiz.questions objectAtIndex:indexPath.row];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionCell *cell = [self getCellFromIndexPath:indexPath];
    
    cell.accessoryType = cell.question.answeredYes ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
    cell.question.answeredYes = !cell.question.answeredYes;
        
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: YES];
    
    
//    BATTrailsViewController *trailsController = [[BATTrailsViewController alloc] initWithStyle:UITableViewStylePlain];
//    trailsController.selectedRegion = [regions objectAtIndex:indexPath.row];
//    [[self navigationController] pushViewController:trailsController animated:YES];
//    [trailsController release];
}

- (QuestionCell *) getCellFromIndexPath: (NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    Question *question = [self.quiz.questions objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"QuestionCell";
    QuestionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    return cell;
}

@end
