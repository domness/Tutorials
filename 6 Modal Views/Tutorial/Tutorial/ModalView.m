//
//  ModalView.m
//  Tutorial
//
//  Created by epigenesys on 15/09/2011.
//  Copyright 2011 epiGenesys. All rights reserved.
//

#import "ModalView.h"


@implementation ModalView

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
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Custom Methods

- (IBAction)closeModal:(id)sender
{
  [self dismissModalViewControllerAnimated:YES];
}

@end
