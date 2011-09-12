//
//  TutorialViewController.h
//  Tutorial
//
//  Created by Robert White on 12/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController <UITableViewDelegate>
{
  IBOutlet UITableView * tableView;
  NSArray * array;
}

@property (nonatomic, retain) UITableView * tableView;

@end
