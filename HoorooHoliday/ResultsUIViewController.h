//
//  ResultsUIViewController.h
//  HoorooHoliday
//
//  Created by James Dunwoody on 31/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface ResultsUIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) Location *location;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *searchHotelsButton;
@property (weak, nonatomic) IBOutlet UIImageView *getInspiredButton;
@property (weak, nonatomic) IBOutlet UIImageView *locationImageView;

@end
