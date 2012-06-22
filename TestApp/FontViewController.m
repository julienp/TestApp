//
//  FontViewController.m
//  TestApp
//
//  Created by Julien Poissonnier on 12/19/11.
//  Copyright (c) 2011 caffeine.lu. All rights reserved.
//

#import "FontViewController.h"
#import "FontPreviewViewController.h"

@interface FontViewController ()
@property (nonatomic, strong) NSDictionary *fontInfo; // fontFamily -> fontNames
@property (nonatomic, strong) NSArray *fontFamilies; // sorted list of fontNames
@end

@implementation FontViewController

- (void)setup
{
    NSMutableDictionary *fontInfo = [[NSMutableDictionary alloc] init];
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        fontInfo[familyName] = fontNames;
    }
    self.fontInfo = fontInfo;
    NSMutableArray *fontFamilies = [[NSMutableArray alloc] init];
    for (NSString *fontFamily in self.fontInfo) {
        [fontFamilies addObject:fontFamily];
    }
    [fontFamilies sortUsingSelector:@selector(compare:)];
    self.fontFamilies = fontFamilies;
    self.title = @"Fonts";
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.fontInfo count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = self.fontFamilies[section];
    return [self.fontInfo[key] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.fontFamilies[section];
    return title;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableSet *indexes = [[NSMutableSet alloc] init];
    for (NSString *fontFamily in self.fontInfo) {
        [indexes addObject:[fontFamily substringToIndex:1]];
    }
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES selector:@selector(compare:)];
    NSArray *titles = [indexes sortedArrayUsingDescriptors:@[descriptor]];
    return titles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger sectionIndex = 0;
    for (NSString *fontFamily in self.fontFamilies) {
        if ([fontFamily compare:title options:NSCaseInsensitiveSearch range:NSMakeRange(0, 1)] == NSOrderedSame) {
            break;
        }
        sectionIndex++;
    }
    return sectionIndex;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *key = self.fontFamilies[indexPath.section];
    NSArray *fontNames = self.fontInfo[key];
    NSString *fontName = fontNames[indexPath.row];
    [cell.textLabel setText:fontName];
    [cell.textLabel setFont:[UIFont fontWithName:fontName size:14]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.fontFamilies[indexPath.section];
    NSArray *fontNames = self.fontInfo[key];
    NSString *fontName = fontNames[indexPath.row];
    FontPreviewViewController *detailViewController = [[FontPreviewViewController alloc] init];
    detailViewController.text = @"The quick brown fox jumps over the lazy dog.";
    detailViewController.fontName = fontName;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
