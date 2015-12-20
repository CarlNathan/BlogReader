//
//  DetailViewController.m
//  BlogReader
//
//  Created by Carl Udren on 12/14/15.
//  Copyright © 2015 Carl Udren. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
//}

//- (void)configureView {
//    // Update the user interface for the detail item.
//    if (self.detailItem) {
//       // self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = self.blogPostURL;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
