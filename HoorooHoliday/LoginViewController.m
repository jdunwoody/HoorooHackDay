//
//  ViewController.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "LoginViewController.h"
#import "MapViewController.h"
#import "MapViewDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"mapView"]) {
//        
//        MapViewController *mapViewController = (MapViewController *)segue.destinationViewController;
//        
//        MapViewDelegate *mapViewDelegate = [[MapViewDelegate alloc] initWithMapView:mapViewController.mapView];
//        mapViewController.mapView.delegate = mapViewDelegate;
//
//        
//        //        AddTypeViewController *destination = (AddTypeViewController *)segue.destinationViewController;
//        //
//        //        destination.addExerciseViewControllerDelegate = self;
//        //
//        //        //        PickerTestViewController *asker = (PickerTestViewController *) segue.destinationViewController;
//        //        //        asker.delegate = self;
//        //        //        asker.question = @"What do you want your label to say?";
//        //        asker.answer = @"Label text";
//    }
//}


@end
