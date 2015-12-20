//
//  DetailViewController.h
//  BlogReader
//
//  Created by Carl Udren on 12/14/15.
//  Copyright © 2015 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

