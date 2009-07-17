//
//  RootViewController.m
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "DirectoryViewController.h"
#import "FileOverviewViewController.h"
#import "CreateDirectoryViewController.h"
#import "CreateFileViewController.h"


@implementation DirectoryViewController

@synthesize directoryContents;

- (NSString *)directoryPath
{
	return directoryPath;
}

- (void)setDirectoryPath:(NSString *)p
{
	[p retain];
	[directoryPath release];
	directoryPath = p;
	
	[self loadDirectoryContents];
	
	NSString *pathTitle = [directoryPath lastPathComponent];
	self.title = pathTitle;
}

- (void)loadDirectoryContents
{
	[directoryContents release];
	directoryContents = [[NSFileManager defaultManager] directoryContentsAtPath:directoryPath];
	[directoryContents retain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *addButton =
		[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
													   target:self
													   action:@selector(showAddOptions)] autorelease];
	self.navigationItem.rightBarButtonItem = addButton;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [directoryContents count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.textLabel.text = (NSString *)[directoryContents objectAtIndex:indexPath.row];

    return cell;
}



- (void)tableView:(UITableView *)tableView
	didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *selectedFile = (NSString *)[directoryContents objectAtIndex:indexPath.row];
	BOOL isDir;
	NSString *selectedPath = [directoryPath stringByAppendingPathComponent:selectedFile];
	if ([[NSFileManager defaultManager] fileExistsAtPath:selectedPath isDirectory:&isDir] && isDir) {
		DirectoryViewController *directoryViewController =
			[[DirectoryViewController alloc] initWithNibName:@"DirectoryViewController"
													  bundle:nil];
		[[self navigationController] pushViewController:directoryViewController animated:YES];
		directoryViewController.directoryPath = selectedPath;
		[directoryViewController release];
	} else {
		FileOverviewViewController *fileOverviewViewController = [[FileOverviewViewController alloc] initWithNibName:@"FileOverviewView" bundle:nil];
		[[self navigationController] pushViewController:fileOverviewViewController animated:YES];
		fileOverviewViewController.filePath = selectedPath;
		[fileOverviewViewController release];
	}
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView 
	commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
	forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// handle a delete swipe
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		NSString *selectedFile = (NSString*)
		[directoryContents objectAtIndex: indexPath.row];
		NSString *selectedPath =
		[directoryPath stringByAppendingPathComponent:
		 selectedFile];
		BOOL canWrite =
		[[NSFileManager defaultManager]
		 isWritableFileAtPath: selectedPath];
		if (! canWrite) {
			// show a UIAlert saying path isn't writable
			NSString *alertMessage = [NSString stringWithFormat: @"Cannot delete %@", selectedFile];
			UIAlertView *cantWriteAlert =
			[[UIAlertView alloc] initWithTitle:@"Not permitted:"
									   message:alertMessage
									  delegate:nil
							 cancelButtonTitle:@"OK"
							 otherButtonTitles:nil];
			[cantWriteAlert show];
			[cantWriteAlert release];
			return;
		}
		
		// try to delete
		NSError *err = nil;
		if (! [[NSFileManager defaultManager] removeItemAtPath: selectedPath error:&err]) {
			// show a UIAlert saying cannot delete
			NSString *alertMessage = (err == noErr) ?
			[NSString stringWithFormat: @"Cannot delete %@", selectedFile] :
			[NSString stringWithFormat: @"Cannot delete %@, %@",
			 selectedFile, [err localizedDescription]];
			UIAlertView *cantDeleteAlert =
			[[UIAlertView alloc] initWithTitle:@"Can't delete:"
									   message:alertMessage
									  delegate:nil
							 cancelButtonTitle:@"OK"
							 otherButtonTitles:nil];
			[cantDeleteAlert show];
			[cantDeleteAlert release];
			return;
		}
		NSArray *deletedPaths = [NSArray arrayWithObject: indexPath];
		
		// refresh display
		[self loadDirectoryContents];
		[self.tableView deleteRowsAtIndexPaths: deletedPaths
		 withRowAnimation: YES];
	}
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)showAddOptions
{
	NSString *sheetTitle = [[NSString alloc] initWithFormat:@"Edit \"%@\"", [directoryPath lastPathComponent]];
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:sheetTitle
															 delegate:self
													cancelButtonTitle:@"Cancel"
											   destructiveButtonTitle:NULL
													otherButtonTitles:@"New File", @"New Directory", NULL];
	[actionSheet showInView:self.view];
	[sheetTitle release];
	[actionSheet release];
}


- (void)createNewFile  {
	BOOL canWrite = [[NSFileManager defaultManager]
					 isWritableFileAtPath: self.directoryPath];
	if (! canWrite) {
		NSString *alertMessage = @"Cannot write to this directory";
		UIAlertView *cantWriteAlert =
		[[UIAlertView alloc] initWithTitle:@"Not permitted:"
								   message:alertMessage delegate:nil
						 cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[cantWriteAlert show];
		[cantWriteAlert release];
		return;
	}
	// present modal view controller to name file
	CreateFileViewController *createFileViewController =
	[[CreateFileViewController alloc]
	 initWithNibName: @"CreateFileView"
	 bundle:nil];
	createFileViewController.parentDirectoryPath = directoryPath;
	createFileViewController.directoryViewController = self;
	createFileViewController.title = @"Create file";
	[[self navigationController]
	 pushViewController:createFileViewController animated:YES];
	[createFileViewController release];
}


- (void)createNewDirectory
{
	BOOL canWrite = [[NSFileManager defaultManager] isWritableFileAtPath:self.directoryPath];
	if (!canWrite) {
		NSString *alertMessage = @"Cannot write to this directory";
		UIAlertView *cantWriteAlert = [[UIAlertView alloc] initWithTitle:@"Not permitted:"
																 message:alertMessage
																delegate:nil
													   cancelButtonTitle:@"OK"
													   otherButtonTitles:nil];
		[cantWriteAlert show];
		[cantWriteAlert release];
		return;
	}
	CreateDirectoryViewController *createDirectoryViewController = [[CreateDirectoryViewController alloc] initWithNibName:@"CreateDirectoryView" bundle:nil];
	createDirectoryViewController.parentDirectoryPath = directoryPath;
	createDirectoryViewController.directoryViewController = self;
	createDirectoryViewController.title = @"Create directory";
	[[self navigationController] pushViewController:createDirectoryViewController animated:YES];
	[createDirectoryViewController release];
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0) {
		[self createNewFile];
	} else if (buttonIndex == 1) {
		[self createNewDirectory];
	}
}



- (void)dealloc {
	[directoryContents release];
    [super dealloc];
}


@end

