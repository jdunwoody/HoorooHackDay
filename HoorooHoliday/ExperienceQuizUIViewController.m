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
#import "MapViewController.h"

@implementation ExperienceQuizUIViewController
@synthesize quizLocationImage;
@synthesize nextQuizButton;
@synthesize quizTitle;
@synthesize subtitle;
@synthesize questionContainer;
@synthesize tableView;
@synthesize title;
@synthesize quiz;
@synthesize total;
@synthesize locations;
@synthesize quizes;
@synthesize quizNumber;

- (void) viewDidLoad
{
    self.title = @"How much do you know?";
    self.quiz = [self.quizes objectAtIndex: [self.quizNumber integerValue]];
    
    self.quizTitle.text = quiz.title;
    self.subtitle.text = quiz.subTitle;
    
    UIImage *image = [UIImage imageNamed:self.quiz.location.imageFilePath];
    
    //    self.quizLocationImage = [[UIImageView alloc] initWithImage:image];
    [self.quizLocationImage setImage:image];
    image = nil;
    
    [self updateTotal];
    
    if ([self nextQuizNumber] < self.quizes.count) {
        self.nextQuizButton.enabled = true;
    }
    
    [super viewDidLoad];
    
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
}

- (void)viewDidUnload {
    [self setTitle:nil];
    [self setQuizTitle:nil];
    [self setSubtitle:nil];
    [self setQuestionContainer:nil];
    [self setTableView:nil];
    [self setTotal:nil];
    [self setQuizLocationImage:nil];
    [self setNextQuizButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
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
    
    if (cell.question.isAnswered) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [cell.text setText: question.text];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    Question *question = [self.quiz.questions objectAtIndex:indexPath.row];
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionCell *cell = [self getCellFromIndexPath:indexPath];
    
    cell.question.answered = cell.question.isAnswered ? NO : YES;
    cell.accessoryType = cell.question.answered ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
    
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: YES];
    
    [self updateTotal];
    
    
    //    BATTrailsViewController *trailsController = [[BATTrailsViewController alloc] initWithStyle:UITableViewStylePlain];
    //    trailsController.selectedRegion = [regions objectAtIndex:indexPath.row];
    //    [[self navigationController] pushViewController:trailsController animated:YES];
    //    [trailsController release];
}

- (void) updateTotal
{
    self.total.text = [NSString stringWithFormat:@"%d/%d", self.quiz.total, self.quiz.questions.count];
}

- (QuestionCell *) getCellFromIndexPath: (NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Question *question = [self.quiz.questions objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"QuestionCell";
    QuestionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.question = question;
    return cell;
}

- (IBAction)finishedWithQuiz:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
    
    //    //    [self.navigationController popToViewController:(UIViewController *)viewController animated:NO];
    //
    //    NSLog(@"Top view controller %@, %@", self.navigationController.topViewController.title, [[self.navigationController.topViewController class] description]);
    //
    //    while (![self.navigationController.topViewController isKindOfClass:[MapViewController class]]) {
    //        NSLog(@"Top view controller %@, %@, %@", self.navigationController.topViewController.title, [self.navigationController.topViewController class],[[self.navigationController.topViewController class] description]);
    //        [self.navigationController popViewControllerAnimated:YES];
    //    }
    //    NSLog(@"Top view controller %@, %@", self.navigationController.topViewController.title, [[self.navigationController.topViewController class] description]);
}

- (int) nextQuizNumber
{
    return [self.quizNumber intValue] + 1;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"nextQuiz"]) {
        if ([self nextQuizNumber] < self.quizes.count) {
            ExperienceQuizUIViewController *nextQuizViewController = (ExperienceQuizUIViewController *)segue.destinationViewController;
            
            nextQuizViewController.quizes = self.quizes;
            nextQuizViewController.quizNumber = [NSNumber numberWithInt:[self nextQuizNumber]];
        }
    }
}

@end
