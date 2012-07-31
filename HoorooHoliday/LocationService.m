//
//  Location.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 28/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "LocationService.h"
#import "Location.h"

@implementation LocationService

+ (NSArray *) loadLocationsFromLocalJson {
    
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    NSError* error;
    
    NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [thisBundle pathForResource:@"locations" ofType:@"json"];
    
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (!jsonString) {
        NSLog(@"Error = %@", error);
        return locations;
    }
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (!json) {
        NSLog(@"Error = %@", error);
        return locations;
    }
    
    NSLog(@"%d locations", [json count]);
    
    //    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    //    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    for (id locationJson in json) {
        NSNumber *x1 = [locationJson objectForKey:@"x1"];
        NSNumber *x2 = [locationJson objectForKey:@"x2"];
        NSNumber *y1 = [locationJson objectForKey:@"y1"];
        NSNumber *y2 = [locationJson objectForKey:@"y2"];
        NSString *name = [locationJson objectForKey:@"name"];
        
        NSString *path = [locationJson objectForKey:@"image_file_path"];
        
        NSArray *imageFilePath;
        if (path == (id)[NSNull null] || path.length == 0) {
            imageFilePath = [[NSArray alloc] init];
        } else {
            imageFilePath = [path componentsSeparatedByString: @"/"];
        }
        //        NSArray* foo = [@"10/04/2011" componentsSeparatedByString: @"/"];
        
        NSLog(@"%@,%@,%@,%@", x1, x2, y1, y2);
        
        Location *location = [[Location alloc] init];
        location.x1 = x1;
        location.x2 = x2;
        location.y1 = y1;
        location.y2 = y2;
        
        location.title = name;
        location.imageFilePath = [imageFilePath lastObject];
        
        if (location.imageFilePath != (id)[NSNull null] && location.imageFilePath.length > 0) {
            [locations addObject:location];
        }
    }
    
    return locations;
}

+ (NSArray *) loadLocationsFromBooking: (NSString *) bookingId
{
    NSArray *allLocations = [self loadLocationsFromLocalJson];

    NSArray *halfArray;
    NSRange theRange;
    
    theRange.location = 0;
    theRange.length = [allLocations count] / 10;
    
    halfArray = [allLocations subarrayWithRange:theRange];
    return halfArray;
 }

@end

//+ (NSArray *)getJsonFromServer {
//    
//    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"test+product_manager@jqdev.net"
//                                                             password:@"password123"
//                                                          persistence:NSURLCredentialPersistenceForSession];
//    
//    NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
//                                             initWithHost:@"http://@hooroo.localhost"
//                                             port:5000
//                                             protocol:@"http"
//                                             realm:nil
//                                             authenticationMethod:nil];
//    
//    
//    [[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential
//                                                        forProtectionSpace:protectionSpace];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://hooroo.localhost:5000/extranet/locations.json"]];
//    
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
//    
//    
//    //    NSData* data = [NSData dataWithContentsOfURL:url];
//    
//    NSMutableArray *locations = [[NSMutableArray alloc] init];
//    
//    NSError* error;
//    
//    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (!json) {
//        NSLog(@"Error = %@", error);
//        return locations;
//    }
//    
//    for (id locationJson in json) {
//        NSLog(@"%@", locationJson);
//        
//        NSNumber *x1 = [locationJson objectForKey:@"x1"];
//        NSNumber *x2 = [locationJson objectForKey:@"x2"];
//        NSNumber *y1 = [locationJson objectForKey:@"y2"];
//        NSNumber *y2 = [locationJson objectForKey:@"y2"];
//        
//        NSLog(@"%d,%d,%d,%d", [x1 intValue], [x2 intValue], [y1 intValue], [y2 intValue]);
//    }
//    
//    return locations;
//}


