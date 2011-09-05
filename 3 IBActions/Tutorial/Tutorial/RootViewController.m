//
//  RootViewController.m
//  Tutorial
//
//  Created by epigenesys on 05/09/2011.
//  Copyright 2011 epiGenesys. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"3. IBAction";
  array = [[NSArray alloc] initWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", @"Row 4", nil];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = [array objectAtIndex:indexPath.row];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  NSLog(@"User selected row %i with value '%@'", indexPath.row, [array objectAtIndex:indexPath.row]);
  
  SecondViewController * secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
  [secondViewController setText:[array objectAtIndex:indexPath.row]];
  [self.navigationController pushViewController:secondViewController animated:YES];
  [secondViewController release];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (void)dealloc
{
  [array release], array = nil;
  [super dealloc];
}

@end
