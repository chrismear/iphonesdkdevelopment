//
//  CreateFileViewController.m
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "CreateFileViewController.h"
#import "DirectoryViewController.h"


@implementation CreateFileViewController

@synthesize fileNameField;
@synthesize fileContentsView;
@synthesize parentDirectoryPath;
@synthesize directoryViewController;

- (void) setUpAsynchronousContentSave {
	NSString *newFilePath =	[parentDirectoryPath
							 stringByAppendingPathComponent: fileNameField.text];
	[[NSFileManager defaultManager] createFileAtPath:newFilePath
											contents:nil attributes:nil];
	
	if ([fileContentsView.text length] != 0) {
		[asyncOutputStream release];
		[outputData release];
		outputData = [[fileContentsView.text 
					   dataUsingEncoding: NSUTF8StringEncoding] retain];
		outputRange.location = 0;
		asyncOutputStream =	[[NSOutputStream alloc] 
							 initToFileAtPath: newFilePath append: NO];
		[asyncOutputStream setDelegate: self]; 
		[asyncOutputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] 
									 forMode:NSDefaultRunLoopMode];
		[asyncOutputStream open];
	} else {
		[directoryViewController loadDirectoryContents];  
		[directoryViewController.tableView reloadData];
		[self.navigationController popViewControllerAnimated:YES]; 
	}
}	

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
	NSOutputStream *outputStream = (NSOutputStream*) theStream;
	BOOL shouldClose = NO;
	switch (streamEvent) {
		case NSStreamEventHasSpaceAvailable: {
			uint8_t outputBuf [1]; 
			outputRange.length = 1;
			[outputData getBytes:&outputBuf range:outputRange];  
			[outputStream write: outputBuf maxLength: 1];
			if (++outputRange.location == [outputData length]) {
				shouldClose = YES;
			}
			break;
		}
		case NSStreamEventErrorOccurred: {
			// dialog the error
			NSError *error = [theStream streamError];
			if (error != NULL) {
				UIAlertView *errorAlert = [[UIAlertView alloc]
										   initWithTitle: [error localizedDescription]
										   message: [error localizedFailureReason]
										   delegate:nil
										   cancelButtonTitle:@"OK"
										   otherButtonTitles:nil];
				[errorAlert show];
				[errorAlert release];
			}
			shouldClose = YES;
			break;
		}
		case NSStreamEventEndEncountered:
			shouldClose = YES;
	}
	if (shouldClose) {
		[outputStream removeFromRunLoop: [NSRunLoop currentRunLoop]
								forMode:NSDefaultRunLoopMode];
		[theStream close]; 
		
		// force update of previous page and dismiss view
		[directoryViewController loadDirectoryContents];  
		[directoryViewController.tableView reloadData];
		[self.navigationController popViewControllerAnimated:YES]; 
	}
}


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
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(setUpAsynchronousContentSave)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
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
