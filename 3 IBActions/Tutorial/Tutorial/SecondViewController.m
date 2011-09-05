//
//  SecondViewController.m
//  Tutorial
//
//  Created by epigenesys on 05/09/2011.
//  Copyright 2011 epiGenesys. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

@synthesize text;

- (void)dealloc
{
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  label.text = text; 
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (IBAction)theAction:(id)sender
{
  UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Woo!" 
                                                       message:@"You pressed the button!" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"Ok" 
                                             otherButtonTitles:nil, nil];
  [alertView show];
  [alertView release];
  
  label.text = @"HelloWorld";
}

@end
