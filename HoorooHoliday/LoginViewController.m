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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"map"]) {
        MapViewController *mapViewController = (MapViewController *)segue.destinationViewController;
        
        mapViewController.bookingId = nil;
    } else if ([segue.identifier isEqualToString:@"mapFromBooking"]) {
        MapViewController *mapViewController = (MapViewController *)segue.destinationViewController;
        
        mapViewController.bookingId = @"12345678";
    }
}

- (IBAction)useBookingEmail:(id)sender {
        
    // do whatever you want with this text field
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

@end
