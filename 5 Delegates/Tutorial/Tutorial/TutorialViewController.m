//
//  TutorialViewController.m
//  Tutorial
//
//  Created by Robert White on 12/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TutorialViewController.h"

@implementation TutorialViewController

@synthesize tableView = _tableView;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  array = [[NSArray alloc] initWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", @"Row 4", nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableView Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }   
  
  // Set the cells textLabel value according to the array
  cell.textLabel.text = [array objectAtIndex:indexPath.row];
  
  return cell;
}  

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   
  // Keeps things pretty by deselecting the selected row rather than leaving it bright blue
  [_tableView deselectRowAtIndexPath:indexPath animated:YES];
  NSLog(@"User selected row %i with value '%@'", indexPath.row, [array objectAtIndex:indexPath.row]);
}   

@end
