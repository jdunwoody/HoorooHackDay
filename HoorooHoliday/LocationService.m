//
//  Location.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "LocationService.h"

@implementation LocationService


+ (NSArray *)getJsonFromServer {
//    NSURLRequest *request =
//    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://user:pass@example.com"]];
//    
//    [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
//    
    NSURL *url = [NSURL URLWithString: @"http://test+product_manager@jqdev.net:password123@hooroo.localhost:5000/extranet/locations.json"];

    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    NSError* error;
    
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (!json) {
        NSLog(@"Error = %@", error);
        return locations;
    }
    
    for (id locationJson in json) {
        NSNumber *x1 = [locationJson objectForKey:@"x1"];
        NSNumber *x2 = [locationJson objectForKey:@"x2"];
        NSNumber *y1 = [locationJson objectForKey:@"y2"];
        NSNumber *y2 = [locationJson objectForKey:@"y2"];
        
        NSLog(@"%d,%d,%d,%d", [x1 intValue], [x2 intValue], [y1 intValue], [y2 intValue]);
    }
    
    return locations;
}

@end


//        SkillTree *skillTree = [[SkillTree alloc] initWithName: name score:score date:date];
//        [skillTrees addObject:skillTree];
//
//        for (id levelJson in [skillTreeJson objectForKey:@"levels"]) {
//            Level *level = [[Level alloc] initWithName:[levelJson objectForKey:@"name"] score:[levelJson objectForKey:@"score"]];
//            [[skillTree levels] addObject:level];
//
//            for (id taskJson in [levelJson objectForKey:@"tasks"]) {
//                NSNumber *status = [taskJson objectForKey:@"status"];
//                NSLog(@"status is %@", status);
//
//                Task *task = [[Task alloc] initWithTaskId:[taskJson objectForKey:@"id"] name:[taskJson objectForKey:@"name"] description:[taskJson objectForKey:@"description"] status:([status intValue] == 1)];
//                [[level tasks] addObject:task];
//
//            }
//        }
//        NSLog(@">>>>>>>>> Dumping in Skill Tree Data Controller getJson for %@", name);
//        [skillTree dump];
