# 3. IBActions

This is about connecting a UIButton to an action

### Open the project
--------------------

Start off by opening the XCode project.

### First Steps
---------------

This starts off by following the previous tutorial and making some changes such as adding a button and a UIButton.

### Implementation with IB
--------------------------

Opening SecondViewController.xib, drag a UIButton onto the screen. Now go back to SecondViewController.h.

### Creating the IBAction
-------------------------

In the header, enter the following:

    - (IBAction)theAction:(id)sender;

Then go into the implementation and write out the new method:

    - (IBAction)theAction:(id)sender
    {
      // Allocate and initialise an UIAlertView with set parameters
      UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Woo!"
                                                           message:@"You pressed the button!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil, nil];
      // Display the UIAlertView on the screen
      [alertView show];
      // Finished with it, so release
      [alertView release];
    }

Inside the method I've just made it show a UIAlertView with some text to the user. You can put anything you want inside this method.

### Connecting the IBAction
---------------------------

Now go back into SecondViewController.xib and from Files Owner, make a new connection from the right hand view where it says 'theAction' to the button and select 'Touch Up Inside'.

You may even modify the label at the same time:

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
