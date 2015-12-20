//
//  BlogPost.m
//  BlogReader
//
//  Created by Carl Udren on 12/19/15.
//  Copyright © 2015 Carl Udren. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        self.thumbnail = nil;
        self.author = nil;
    }
    return self;
}

+(id) blogPostWithTitle: (NSString *)title{
    return [[self alloc] initWithTitle:title];
}

-(NSURL *) thumbnailURL{
    return [NSURL URLWithString:self.thumbnail];
}

-(NSString *)formattedDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    [dateFormatter setDateFormat:@"EE MMM, dd"];
    return [dateFormatter stringFromDate:tempDate];
}

@end
