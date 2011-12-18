//
//  LazyTable.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/21/11.
//  Copyright 2011 caffeine.lu. All rights reserved.
//

#import "LazyTable.h"


@implementation LazyTable {
    NSOperationQueue *queue;
    NSCache *cache;
}

static NSString *imagePaths[] = {@"2010_02_9086.jpg", @"2010_02_9097.jpg", @"2010_02_9101.jpg", @"2010_02_9105.jpg", @"2010_02_9108.jpg", @"2010_02_9112.jpg", @"2010_02_9116.jpg", @"2010_02_9128.jpg", @"CD12 002.jpg", @"CD12 006.jpg", @"CD12 014.jpg", @"CD12 015.jpg", @"CD12 017.jpg", @"CD12 021.jpg", @"CD12 022.jpg", @"CD12 024.jpg", @"CD12 026.jpg", @"CD12 028.jpg", @"CD12 030.jpg", @"CD12 031.jpg", @"CD12 032.jpg", @"CD12 036.jpg", @"CD2 2010 002.jpg", @"CD2 2010 003.jpg", @"CD2 2010 004.jpg", @"CD2 2010 005.jpg", @"CD2 2010 006.jpg", @"DSCN1478.jpg", @"DSCN1524.jpg", @"DSCN1531.jpg", @"DSCN1607.jpg", @"DSCN1675.jpg", @"DSCN1936.jpg", @"DSCN1939.jpg", @"DSCN1940.jpg", @"DSCN1947.jpg", @"DSCN4467.JPG", @"DSCN4482.JPG", @"DSCN4488.JPG", @"DSCN4497.JPG", @"DSCN4518.JPG", @"DSCN4539.JPG", @"DSCN4561.JPG", @"DSCN4566.JPG", @"DSCN4571.JPG", @"DSCN4574.jpg", 
};

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        queue = [[NSOperationQueue alloc] init];
        cache = [[NSCache alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sizeof(imagePaths)/sizeof(imagePaths[0]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *key = imagePaths[indexPath.row];
    UIImage *image = [cache objectForKey:key];
    if (image != nil) {
        [cell.imageView setImage:image];
        [cell setNeedsLayout];
    } else {
        NSString *urlEncoded = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *path = [@"http://chpoissonnier.com/images/peinture/full/" stringByAppendingString:urlEncoded];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            if (error != nil) {
                NSLog(@"%@: could not load %@", error, response);
            } else {
                UIImage *image = [UIImage imageWithData:data];
                if (image != nil) {
                    [cache setObject:image forKey:key];
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        [cell.imageView setImage:image];
                        [cell setNeedsLayout];
                    });
                }
            }
        }];
    }
    
    cell.textLabel.text = key;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
