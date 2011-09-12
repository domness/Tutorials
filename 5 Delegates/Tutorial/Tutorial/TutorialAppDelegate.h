//
//  TutorialAppDelegate.h
//  Tutorial
//
//  Created by Robert White on 12/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TutorialViewController;

@interface TutorialAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TutorialViewController *viewController;

@end
