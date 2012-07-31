//
//  ResultsUIViewController.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 31/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "ResultsUIViewController.h"

@implementation ResultsUIViewController
@synthesize locationLabel2;
@synthesize searchHotelsButton;
@synthesize getInspiredButton;
@synthesize locationImageView;
@synthesize locationLabel, location;

- (void)viewDidLoad
{
    self.locationLabel.text = self.location.title;
    self.locationImageView.image = [UIImage imageNamed:self.location.imageFilePath];
    
//    [UIView beginAnimations:nil context:NULL];
//    CGRect newLocation = CGRectMake(self.searchHotelsButton.frame.origin.x, self.searchHotelsButton.frame.origin.y, self.searchHotelsButton.frame.size.width, self.searchHotelsButton.frame.size.height);
//    
//    newLocation.origin.x += 10;
//    self.searchHotelsButton.frame = newLocation;
//    [UIView setAnimationDuration:0.3];
//    [UIView setAnimationRepeatAutoreverses:YES];
//    [UIView setAnimationRepeatCount: 1e30f];
//    [UIView commitAnimations];
    
    [super viewDidLoad];
}

- (void)viewDidUnload {
    
    [self setLocationLabel:nil];
    
    [self setLocationLabel2:nil];
    [self setSearchHotelsButton:nil];
    [self setGetInspiredButton:nil];
    [self setLocationImageView:nil];
    [super viewDidUnload];
}
@end
