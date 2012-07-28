//
//  MapViewController.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.mapView = nil;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"mapView"]) {
        //        AddTypeViewController *destination = (AddTypeViewController *)segue.destinationViewController;
        //
        //        destination.addExerciseViewControllerDelegate = self;
        //
        //        //        PickerTestViewController *asker = (PickerTestViewController *) segue.destinationViewController;
        //        //        asker.delegate = self;
        //        //        asker.question = @"What do you want your label to say?";
        //        asker.answer = @"Label text";
//    }
//}

@end
