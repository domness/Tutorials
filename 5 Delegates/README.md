# 5. UITableView and UITextField methods through Delegation

Whilst we mentioned briefly in Section 0 what Delegates are, this tutorial contains a practical demonstration of them in use.

### Starting a new project (called Tutorial)
------------------------------------------------

### Sorting out the basics

We are going to start off by starting a new View Based Controller, which does not contain by default a UITableView.

Open up the TutorialViewController.h and add to the end of the @interface line <UITableViewDelegate> (to allow our UIViewController to provide the methods mentioned in previous tutorials to populate the tableView with data etc)

  @interface TutorialViewController : UIViewController <UITableViewDelegate>
  {
    // Our tableView to be added to the view
    IBOutlet UITableView * tableView;
  }

  // To be synthesized in our .m, (just to make things easier for us)
  @property (nonatomic, retain) UITableView * tableView;

Now in the .m file we'll add the following short snippet:

  @implementation TutorialViewController

  @synthesize tableView = _tableView;

Note that I've synthesized the tableView under a different pointer name to make things less confusing later on (as tableView has a method scope as well as a class scope caused by us creating a new instance variable under the same name)

### Hooking things up in InterfaceBuilder

Opening up IB, we'll drag a UITableView into our pre-existing UIView; to do so:

    Make sure the right pane is open (top right corner, next to the Organizer button); in the lower section, locate "Table View" and drag it into the view shown in TutorialViewController.xib

    Select the newly added Table View and go to the outlets tab in the right-hand pane (the section denoted by the arrow icon) and drag the delegate over to the File's Owner, then do the same with dataSource.

    Note: dataSource provides such methods as cellForRowAtIndexPath and other methods for setting up views, whereas the delegate provides such methods as didSelectRowAtIndexPath and other methods for interacting with the views.

    Then select the File's Owner on the left hand side, and from the listed Outlets, drag tableView to connect to our newly added Table View, after which we no longer need the Interface Builder.


### Checking everything's working

Just to check that everything's hooked up properly and we can call the appropriate methods from our UIViewController, add an array as in Tutorial 1: UITableView

    In our header file, we add an array

    @interface TutorialViewController : UIViewController <UITableViewDelegate>
    {
      // Our tableView to be added to the view
      IBOutlet UITableView * tableView;
      NSArray * array;
    }

    In our implemenatation file, we add the following:

    To our ***viewDidLoad*** method, we'll once again set up the array:

    array = [[NSArray alloc] initWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", @"Row 4", nil];

    As we're adding methods that belong to a separate aspect of our application, we usually denote this with a pragma mark:

    #pragma mark - UITableView Delegate methods

  Then we add the basic methods for the tableView:

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
      return [array count];
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
      static NSString *CellIdentifier = @"Cell";

      UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
      if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
      }

      // Set the cells textLabel value according to the array
      cell.textLabel.text = [array objectAtIndex:indexPath.row];

      return cell;
    }

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
      [_tableView deselectRowAtIndexPath:indexPath animated:YES];
      NSLog(@"User selected row %i with value '%@'", indexPath.row, [array objectAtIndex:indexPath.row]);
    }


### External Reference Material

http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UITableViewDataSource_Protocol/Reference/Reference.html
http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UITableViewDelegate_Protocol/Reference/Reference.html
