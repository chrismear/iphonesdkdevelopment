//
//  DVDCabinetController.m
//  DVDCase
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "DVDCabinetController.h"


@implementation DVDCabinetController

@synthesize key;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSArray *keys = [NSArray arrayWithObjects:@"home", @"work", nil];
	NSArray *homeDVDs = [NSArray arrayWithObjects:@"Thomas the Builder", nil];
	NSArray *workDVDs = [NSArray arrayWithObjects:@"Intro to Blender", nil];
	NSArray *values = [NSArray arrayWithObjects:homeDVDs, workDVDs, nil];
	
	data = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[((UITableView *)self.view) reloadData];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [[data valueForKey:self.key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier]
				autorelease];
	}
	cell.textLabel.text = [[data valueForKey:self.key] objectAtIndex:indexPath.row];
	return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.navigationController popViewControllerAnimated:YES];
}


- (void)dealloc {
    [super dealloc];
}


@end
