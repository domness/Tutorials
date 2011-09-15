//
//  RootViewController.m
//  Tutorial
//
//  Created by epigenesys on 05/09/2011.
//  Copyright 2011 epiGenesys. All rights reserved.
//

#import "RootViewController.h"
#import "ModalView.h"

@implementation RootViewController

@synthesize tableView;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"6. Modal Views";
  array = [[NSMutableArray alloc] initWithObjects:
           [NSDictionary dictionaryWithObjectsAndKeys:
            @"Mercury Taxis", @"name",
            @"0114 266 2662", @"number", nil],
           [NSDictionary dictionaryWithObjectsAndKeys:
            @"Abbey Taxis", @"name",
            @"0800 244 442", @"number", nil],
           [NSDictionary dictionaryWithObjectsAndKeys:
            @"City Taxis", @"name",
            @"0114 239 3939", @"number", nil],
           [NSDictionary dictionaryWithObjectsAndKeys:
            @"Ace Wedding Cars", @"name",
            @"0114 281 8111", @"number", nil],
           nil];
  [self addHeaderAndFooter];
  
  UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Modal" 
                                                                     style:UIBarButtonItemStyleBordered 
                                                                    target:self 
                                                                    action:@selector(openModal)];
  [self.navigationItem setRightBarButtonItem:barButtonItem];
  [barButtonItem release];
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

- (UITableViewCell *) getCellContentView:(NSString *)cellIdentifier 
{
	CGRect rect = [self.tableView bounds];
	CGRect CellFrame = CGRectMake(0, 0, rect.size.width, 10);
	CGRect CompanyFrame = CGRectMake(70, 12, 235, 15);
	CGRect TextFrame = CGRectMake(70, 29, 235, 15);
	UILabel *lblTemp;
  
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:CellFrame 
                                                  reuseIdentifier:cellIdentifier] autorelease];
	lblTemp = [[UILabel alloc] initWithFrame:CompanyFrame];
	lblTemp.tag = 1;
	lblTemp.opaque = NO;
	lblTemp.font = [UIFont boldSystemFontOfSize:13];
	lblTemp.backgroundColor = [UIColor clearColor];
	lblTemp.textColor = [UIColor darkGrayColor];
	lblTemp.textAlignment = UITextAlignmentLeft;
	lblTemp.shadowColor = [UIColor whiteColor];
	lblTemp.shadowOffset = CGSizeMake(0, 1);
	[cell.contentView addSubview:lblTemp];
	[lblTemp release];
	
	lblTemp = [[UILabel alloc] initWithFrame:TextFrame];
	lblTemp.tag = 2;
	lblTemp.numberOfLines = 0;
	lblTemp.lineBreakMode = UILineBreakModeWordWrap;
	lblTemp.adjustsFontSizeToFitWidth = NO;
	lblTemp.font = [UIFont systemFontOfSize:13];
	lblTemp.textColor = [UIColor darkGrayColor];
	lblTemp.backgroundColor = [UIColor clearColor];
	lblTemp.shadowColor = [UIColor whiteColor]; 
	lblTemp.shadowOffset = CGSizeMake(0, 1);
	[cell.contentView addSubview:lblTemp];
	[lblTemp release];

	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		cell = [self getCellContentView:CellIdentifier];
	}
  else{
		[cell.contentView viewWithTag:999];
	}
  
  cell.backgroundColor = [UIColor clearColor];
  
  UILabel       * company   = (UILabel *)[cell viewWithTag:1];
	UILabel       * text      = (UILabel *)[cell viewWithTag:2];

  company.text = [[array objectAtIndex:indexPath.row] objectForKey:@"name"];
  text.text = [[array objectAtIndex:indexPath.row] objectForKey:@"number"];

  
  UIImage * background = [UIImage imageNamed:@"CellGradientBackground.png"];
  UIImageView *imageView = [[UIImageView alloc] initWithImage:background];
  imageView.contentMode = UIViewContentModeScaleToFill;
  [cell setBackgroundView:imageView];
  [imageView release];
  
  UIImage * backgroundSelected = [UIImage imageNamed:@"CellGradientBackgroundHighlighted.png"];
  UIImageView * backgroundImageView = [[UIImageView alloc] initWithImage:backgroundSelected];
  backgroundImageView.image = backgroundSelected;
  [cell setSelectedBackgroundView:backgroundImageView];
  [backgroundImageView release];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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

#pragma mark -
#pragma mark Custom Methods

- (void)addHeaderAndFooter
{
  UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
  v.backgroundColor = [UIColor clearColor];
  [self.tableView setTableHeaderView:v];
  [self.tableView setTableFooterView:v];
  [v release];
}

- (void)openModal
{
  NSLog(@"User pressed the modal button.");
  ModalView * modal = [[ModalView alloc] initWithNibName:@"ModalView" bundle:nil];
  [self presentModalViewController:modal animated:YES];
  [modal release];
}

@end
