# 6. Modal Views

There are 2 main ways a new view (with UIViewController) can be pushed to the screen on iPhone OS (more on the iPad):

- Pushing the view using the UINavigationController
- Sliding the view up as a modal view controller.

### Open the tutorial project (from Tutorial 4)
------------------------------------------------

In this tutorial we are going to add a new button to the navigation bar that opens up a modal view.

### Sorting out the basics

Open RootViewController.h and add the method for **openModal**:

    - (void)openModal;

Opening RootViewController.m in the **viewDidLoad** method, we will add the following:

    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Modal" 
                                                                       style:UIBarButtonItemStyleBordered 
                                                                      target:self 
                                                                      action:@selector(openModal)];
    [self.navigationItem setRightBarButtonItem:barButtonItem];
    [barButtonItem release];
    
We then add the following to the bottom of the file before **@end**:

    - (void)openModal
    {
      NSLog(@"User pressed the modal button.");
    }


This adds the new button to the navigation bar that will use the **openModal** method when pressed.

Now the button we've added to the navigation bar will print to the console.

Before we can show a new view, we need to add it to the project.

### Adding the new view

Follow:

  File > New > New File > UIViewControllerSubclass > Subclass of UIViewController
  
And save the file as ModalView.

Going back to RootViewController.m, at the top of the file type in:

    #import "ModalView.h"
    
And then inside **- (void)openModal** type:

    ModalView * modal = [[ModalView alloc] initWithNibName:@"ModalView" bundle:nil];
    [self presentModalViewController:modal animated:YES];
    [modal release];
    
This creates a new instance of the controller and tells which .xib file to use for the UI. It then presents the modal view controller by pushing the view up the screen (by default). After this, we release the controller as we don't need it anymore within RootViewController. Modal views are great for changing the interaction with the views and doesn't use the navigation controller.

You will notice that at this stage you have no way of getting back to the previous view...

### Adding a close button

In ModalView.xib we will now add the nav bar and a close button.

First add a UINavigationBar to the top of the screen, and then drag and drop a UIBarButtonItem onto this.

Now inside ModalView.h we will add the method:

    - (IBAction)closeModal:(id)sender;

And then inside the .m we will write the implementation:

    - (IBAction)closeModal:(id)sender
    {
      [self dismissModalViewControllerAnimated:YES];
    }
    
This will tell the app to dismiss the top most view controller.

Now we have the action, we go back into the XIB and click on 'File's Owner' and then from the right hand side bar drag the outlet from **closeModal:** to the UIBarButtonItem.

## Finished

Now you should be able to use the button on the first screen to open a modal view controller and then use the UIBarButtonItem action on the modal view to go back to the first screen.

### External Reference Material

<!-- http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UITableViewDataSource_Protocol/Reference/Reference.html
http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UITableViewDelegate_Protocol/Reference/Reference.html -->
