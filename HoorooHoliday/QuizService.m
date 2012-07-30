//
//  QuizService.m
//  HoorooHoliday
//
//  Created by James Dunwoody on 30/07/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//

#import "QuizService.h"
#import "Quiz.h"
#import "Question.h"

@implementation QuizService

+ (Quiz *) load
{
    Quiz *quiz = [[Quiz alloc] init];
    quiz.title = @"Get In The Hot Spot's Top 5 Noosa Finds";
    quiz.subTitle = @"by Annabel Candy, Top 5. Be the first to share your tip…";
    
    Question *question = nil;
    
    question = [[Question alloc] init];
    question.text = @"Best kept secret for foodies? Jardin Japonesque, a Japanese restaurant on Arcadia Street in Noosa Junction. Owned by a former Wasabi chef this tiny restaurant has equally good food at a fraction of the price. Make sure you book and bring your own alcoholic drinks if you wish to indulge.";
    
    [quiz.questions addObject: question];
    question = nil;
    
    question = [[Question alloc] init];
    question.text = @"Best fine dining on a budget? Check out the early bird specials at River Cottage Cafe near Gympie Terrace where you can savour a very special three course meal for only $49. Owner and head chef Marc Wohner cooks up contemporary European and Australian food, using fresh local produce";

    [quiz.questions addObject: question];
    question = nil;
    
    question = [[Question alloc] init];
    question.text = @"Best surf spot? I rate Coolum for beginners. The surf is often gentler than in Noosa, the water less crowded and the team at Coolum Surf School will have you surfing in no time.";
    
    [quiz.questions addObject: question];
    question = nil;
    
    question = [[Question alloc] init];
    question.text = @"Best spa? Stephanie's Ocean Spa at Outrigger Resort on Little Hastings Street has a sublime flotation tank. It’s big enough for two or three people if you want to go with friends. Or book the Vichy Suite for solo indulgence where you’ll be massaged on a hand-crafted acacia cedar massage table while water pours gently over you.";
    
    [quiz.questions addObject: question];
    question = nil;
    
    question = [[Question alloc] init];
    question.text = @"Best splurge? Get in touch with the Noosa Dream Boats team and book a cruise in their glamorous wooden fifties-style motor boat. Put your sunnies and head scarf then channel your inner Marilyn Monroe while you enjoy a sunset cruise down the Noosa River.";
    
    [quiz.questions addObject: question];
    question = nil;
    
    return quiz;
}
@end
