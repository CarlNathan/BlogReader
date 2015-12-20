//
//  BlogPost.h
//  BlogReader
//
//  Created by Carl Udren on 12/19/15.
//  Copyright © 2015 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *author;
@property(strong, nonatomic) NSURL *url;
@property(strong, nonatomic) NSString *thumbnail;
@property(strong, nonatomic) NSString *date;


//Designated initializer
-(id) initWithTitle:(NSString *)title;

+(id) blogPostWithTitle: (NSString *)title;

-(NSURL *) thumbnailURL;
-(NSString *)formattedDate;

@end
