# 1. UITableView

This is about creating a UITableView with each cell coming from an NSArray

### Open the project
--------------------

Start off by opening the XCode project.

### First Steps
---------------

The default Navigation-based project starts off with a UITableViewController. This needs no changes to the XIB (Interface Builder) file to get started.

I start off by opening RootViewController.h and creating a new NSArray variable.

    NSArray *array;

There are two different types of array in Cocoa:

- NSArray
- NSMutableArray

NSArrays can only be modified when they are created. NSMutableArrays can be modified at any point using a large number of methods.

In this first project, we are only going to create the array and get values from it.

### Implementation

In the ***viewDidLoad*** method (that is called when the view is first loaded...) I will start by setting up the array:

    array = [[NSArray alloc] initWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", @"Row 4", nil];

I then modify the ***numberOfRowsInSection*** for the tableView.

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
      return [array count];
    }

This gives the total number of rows as the total number of entries in the array.

    Note: This is only applicable for UITableView with a single section, for multiple sections you would likely have a 2D array, with you calling the method on the object at the index of the section given; i.e. [[array objectAtIndex:section] count];

Next, I want to output each row in the array in each row of the UITableView:

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
      static NSString *CellIdentifier = @"Cell";

      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
      // Alloc and initialise the cell if it hasn't been already
      if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
      }

      // Set the cells textLabel value according to the array
      cell.textLabel.text = [array objectAtIndex:indexPath.row];

      return cell;
    }

Next, I want it to output a value to the console when the user selects a row:

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
      // Keeps things pretty by deselecting the selected row rather than leaving it bright blue
      [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
      NSLog(@"User selected row %i with value '%@'", indexPath.row, [array objectAtIndex:indexPath.row]);
    }

