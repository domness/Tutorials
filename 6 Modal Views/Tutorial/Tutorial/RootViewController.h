//
//  RootViewController.h
//  Tutorial
//
//  Created by epigenesys on 05/09/2011.
//  Copyright 2011 epiGenesys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
  IBOutlet UITableView *tableView;
  NSArray *array;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

- (void)addHeaderAndFooter;
- (void)openModal;

@end
