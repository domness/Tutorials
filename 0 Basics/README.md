# 0. Basics

Here are a few of the basics:

### Variables

If you want variables to be available to the whole implementation file, then using the .h, on the line below the @interface you want to do something like:

    NSString *string;

This gives an NSString with the variable name 'string'.

If you only want it to be available to a method, then you just write that in the method or something similar to:

    NSString *string = @"this is a string";

Or

    NSString *string = [[NSString alloc] initWithString:@""];

### Console Logs

To output code to the console you use the line:

    NSLog(@"this is a console message");

You can output anything with NSLog such as NSStrings, NSArray's, NSObjects etc. However, to make sure it outputs it correctly, Cocoa has a special way of turning this data into readable strings.

Here are some outputs

    // Strings need %@
    NSString * string = @"this is the string";
    NSLog(@"Here is the string: %@", string);

    // Ints need %i
    int theInt = 42;
    NSLog(@"Here is the int: %i", theInt);

    // Doubles need %d
    double theDouble = 0.01;
    NSLog(@"Here is the double: %d", theDouble);

    // Floats need %f
    float theFloat = 0.01f;
    NSLog(@"Here is the float: %f", theFloat);

    // NSArrays and NSDictionarys can be called with %@
    NSArray * array = [NSArray arrayWithObjects:@"Row 0", @"Row 1", nil];
    NSLog(@"Here is the array: %@", array);


### Memory Management

Memory management is important when developing iPhone/iPad applications. A standard way of implementing memory management in a method is as follows:

    NSArray *array = [[NSArray alloc] initWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", nil];
    // When you're finished with the array
    [array release], array = nil;

We release the NSArray as we have allocated it into memory. We **wouldn't** release the object if we had called autorelease:

    NSArray *array = [[[NSArray alloc] initWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", nil] autorelease];

Or if we had not called *alloc*:

    NSArray *array = [NSArray arrayWithObjects:@"Row 0", @"Row 1", @"Row 2", @"Row 3", nil];

Each view controller has a ***dealloc*** method. This is called when the view is popped or dismissed. Here is where you release all your objects.

Memory leaks also occur when you initialise objects but don't use them. This may happen if you want to initialise all your objects in ***viewDidLoad*** but the user may not end up using all the objects. This will turn up in XCode's 'Instruments' as leaks even though you may release the objects correctly. Using 'Instruments' helps a lot with object/memory allocations as it helps to cut down unused methods, allocations and initialisations by telling you where objects are created that are giving leaks. Learn to only allocate memory when and where you need it and then release the objects as soon as you can.

In most applications that you start developing as small projects won't need intensive memory management, but it is always good to get a good head start.

### Delegates

Delegates are called in the header of files that use them. They are connected to objects that will call methods in your view controllers. If you don't have the correct methods written in your controllers then they won't be called.

Delegates are used by pretty much all available API's from Apple and other 3rd party code. Here are a few examples:

#### UITableView's

The UITableViews use delegate methods to notify the view controllers of things such as the row that has been selected by the user. To implement this, we make sure the UITableView is connected to the Files Owner and making the Files Owner it's delegate.

We then have the method:

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        NSLog(@"User selected row: %i", indexPath.row);
    }

This is automatically called by the UITableView.
