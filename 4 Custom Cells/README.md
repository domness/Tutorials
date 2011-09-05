# 4. Custom Cells with NSDictionarys and NSArrays

Custom cells are really useful when making an application such as a Twitter client etc. as the pre-made UITableView cells are pretty useless in terms of the customisations.

### Using the project from the previous tutorial
------------------------------------------------

We are going to start off by making some dictionary's and an array to contain them all in for the UITableView:

    array = [[NSMutableArray alloc] initWithObjects:
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Mercury Taxis", @"name",
              @"0114 266 2662", @"number", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Abbey Taxis", @"name",
              @"0800 244 442", @"number", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"City Taxis", @"name",
              @"0114 239 3939", @"number", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Ace Wedding Cars", @"name",
              @"0114 281 8111", @"number", nil],
             nil];
             
NSDictionary's, like hashes, can get objects using a key. This is done with:

    [NSDictionary objectForKey:@"the_key"];
    
To get the dictionary value for "the_key"; for the first value in the array, you use the following:

    [[array objectAtIndex:0] objectForKey:@"the_key"];

We can now modify the RootViewController cell.textLabel.text to have the following:

    cell.textLabel.text = [[array objectAtIndex:indexPath.row] objectForKey:@"name"];
    
### Custom Cells

For this, we need to modify the cells and create them from scratch. I am going to give each element a tag number so when we input the values for each UI element we get the object using their tag number.

    - (UITableViewCell *) getCellContentView:(NSString *)cellIdentifier 
    {
    	CGRect rect = [self.tableView bounds];
    	CGRect CellFrame = CGRectMake(0, 0, rect.size.width, 10);
    	CGRect CompanyFrame = CGRectMake(70, 12, 235, 15);
    	CGRect TextFrame = CGRectMake(70, 29, 235, 15);
    	UILabel *lblTemp;

    	UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:CellFrame 
                                                      reuseIdentifier:cellIdentifier] autorelease];
    	lblTemp = [[UILabel alloc] initWithFrame:CompanyFrame];
    	lblTemp.tag = 1;
    	lblTemp.opaque = NO;
    	lblTemp.font = [UIFont boldSystemFontOfSize:13];
    	lblTemp.backgroundColor = [UIColor clearColor];
    	lblTemp.textColor = [UIColor darkGrayColor];
    	lblTemp.textAlignment = UITextAlignmentLeft;
    	lblTemp.shadowColor = [UIColor whiteColor];
    	lblTemp.shadowOffset = CGSizeMake(0, 1);
    	[cell.contentView addSubview:lblTemp];
    	[lblTemp release];

    	lblTemp = [[UILabel alloc] initWithFrame:TextFrame];
    	lblTemp.tag = 2;
    	lblTemp.numberOfLines = 0;
    	lblTemp.lineBreakMode = UILineBreakModeWordWrap;
    	lblTemp.adjustsFontSizeToFitWidth = NO;
    	lblTemp.font = [UIFont systemFontOfSize:13];
    	lblTemp.textColor = [UIColor darkGrayColor];
    	lblTemp.backgroundColor = [UIColor clearColor];
    	lblTemp.shadowColor = [UIColor whiteColor]; 
    	lblTemp.shadowOffset = CGSizeMake(0, 1);
    	[cell.contentView addSubview:lblTemp];
    	[lblTemp release];

    	return cell;
    }
    
And for ***cellForRowAtIndexPath*** I have the following:

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
    	static NSString *CellIdentifier = @"Cell";

    	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    	if (cell == nil) {
    		cell = [self getCellContentView:CellIdentifier];
    	}
      else{
    		[cell.contentView viewWithTag:999];
    	}

      cell.backgroundColor = [UIColor clearColor];

      UILabel       * company   = (UILabel *)[cell viewWithTag:1];
    	UILabel       * text      = (UILabel *)[cell viewWithTag:2];

      company.text = [[array objectAtIndex:indexPath.row] objectForKey:@"name"];
      text.text = [[array objectAtIndex:indexPath.row] objectForKey:@"number"];

      UIImage * background = [UIImage imageNamed:@"CellGradientBackground.png"];
      UIImageView *imageView = [[UIImageView alloc] initWithImage:background];
      imageView.contentMode = UIViewContentModeScaleToFill;
      [cell setBackgroundView:imageView];
      [imageView release];

      UIImage * backgroundSelected = [UIImage imageNamed:@"CellGradientBackgroundHighlighted.png"];
      UIImageView * backgroundImageView = [[UIImageView alloc] initWithImage:backgroundSelected];
      backgroundImageView.image = backgroundSelected;
      [cell setSelectedBackgroundView:backgroundImageView];
      [backgroundImageView release];

      return cell;
    }
    
The code:

- Takes the company label and the text label from the cell creation
- Inputs the text from the array/dictionary
- Creates a background image
- Returns the cell

Make sure to have the correct image files in the project folders (Cell's and NavBar created by Dominic Wroblewski)

### Other UI Changes

You may have noticed I made other UI changes to the application such as the background image, and the navigation bar. This was done by changing the RootViewController class from a UITableViewController to a UIViewController. I then modified the XIB by removing the UITableView and adding a UIView, with a UITableView on top of that. The next step was to connect the view from the Files Owner to the view I added to the XIB, then to connect the tableView to the new UITableView I added. Finally to connect from the UITableView, to the Files Owner, the Data Source and the Delegate. Finally adding in the background the image.
