//
//  SecondViewController.h
//  Tutorial
//
//  Created by epigenesys on 05/09/2011.
//  Copyright 2011 epiGenesys. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController
{
  IBOutlet UILabel *label;
  NSString *text;
}

@property (nonatomic, retain) NSString *text;

@end
