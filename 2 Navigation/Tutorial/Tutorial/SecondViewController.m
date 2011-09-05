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

@end
