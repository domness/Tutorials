# 2. Navigation

This is about pushing a new view controller to the screen.

### Open the project
--------------------

Start off by opening the XCode project.

### First Steps
---------------

This starts off by following the previous tutorial and making some changes such as adding a new view.

Firstly, we create a new view controller. From the menu bar, follow:

`File > New > New File > UIViewController Subclass > Next > Subclass of UIViewController (with XIB for user interface) > Next`

Then name the class, I am going to name mine 'SecondViewController'.

### Implementation with IB

I want to be able to push the value from the first view controller to the second view controller and output it to a label. So, I am going to start off by opening the header for the SecondViewController and creating a new link to the Interface Builder.

I have the following:

    #import <UIKit/UIKit.h>


    @interface SecondViewController : UIViewController
    {
      IBOutlet UILabel *label;
      NSString *text;
    }

    @property (nonatomic, retain) NSString *text;

    @end

and in the SecondViewController.m file I type:

    @synthesize text;
    
and
  
    - (void)viewDidLoad
    {
      [super viewDidLoad];
      label.text = text; 
    }
    
***IBOutlet*** enables me to connect the 'label' element with the Interface builder. This means that everytime I changed 'label' in the implementation code for the SecondViewController it directly accesses the connected UILabel.

The @property and @synthesize lines are not needed all the time. But, this enables the text to be directly accessible by other controllers. This is great for pushing new view controllers and accessing values and objects.

I then open up SecondViewController.xib and from File's Owner I use the right hand view to make a connection from 'label' to a brand new UILabel that I have dragged onto the screen.

After this is done, I no longer need Interface Builder.

### Next Steps

Now I have the label variable connected with the UI, I can start playing around with it's values.

Now I want to go to the RootViewController.m and push the SecondViewController onto the screen when the user taps a table cell.

To do this, I want to import 'SecondViewController.h'. You want the top of the RootViewController to look like follows:

    #import "RootViewController.h"
    #import "SecondViewController.h"

    @implementation RootViewController

Then I go down to the method:

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

And type the following:

    SecondViewController * secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [secondViewController setText:[array objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:secondViewController animated:YES];
    [secondViewController release];

### Output

Now when the user selects a row, it pushes to the new view controller and it shows the array row text in the next view controller's label.
