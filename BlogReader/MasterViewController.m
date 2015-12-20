//
//  MasterViewController.m
//  BlogReader
//
//  Created by Carl Udren on 12/14/15.
//  Copyright © 2015 Carl Udren. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BlogPost.h"


@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.blogPosts = [NSMutableArray array];
    NSArray *blogPostsArray  = [dataDictionary  objectForKey:@"posts"];
    
    for (NSDictionary *bpDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }

    }

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = self.blogPosts[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        NSURL *url = blogPost.url;
        NSString *title = blogPost.title;
        [controller setBlogPostURL:url];
        controller.navigationItem.title = title;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", blogPost.author, [blogPost formattedDate]];
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
    
    NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    }
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark - Table view delegate

/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:blogPost.url];
 


} */


@end
