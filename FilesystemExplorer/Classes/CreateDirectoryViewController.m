//
//  CreateDirectoryViewController.m
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "CreateDirectoryViewController.h"
#import "DirectoryViewController.h"

@implementation CreateDirectoryViewController

@synthesize parentDirectoryPath;
@synthesize directoryViewController;
@synthesize directoryNameField;

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

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(createNewDirectory)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
}

- (void)createNewDirectory
{
	[directoryNameField resignFirstResponder];
	NSString *newDirectoryPath = [parentDirectoryPath stringByAppendingPathComponent:directoryNameField.text];
	[[NSFileManager defaultManager] createDirectoryAtPath:newDirectoryPath attributes:nil];
	
	[directoryViewController loadDirectoryContents];
	[directoryViewController.tableView reloadData];
	[self.navigationController popViewControllerAnimated:YES];
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


- (void)dealloc {
    [super dealloc];
}


@end
