//
//  FileOverviewViewController.m
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "FileOverviewViewController.h"


@implementation FileOverviewViewController

@synthesize fileNameLabel;
@synthesize fileSizeLabel;
@synthesize fileModifiedLabel;

- (NSString *)filePath
{
	return filePath;
}

- (void)setFilePath:(NSString *)p
{
	if (filePath != NULL) {
		[filePath release];
	}
	[p retain];
	filePath = p;
	
	[self updateFileOverview];
	
	NSString *pathTitle = [filePath lastPathComponent];
	self.title = pathTitle;
}

- (void)updateFileOverview
{
	if (self.filePath != NULL) {
		NSString *fileName = [self.filePath lastPathComponent];
		fileNameLabel.text = fileName;
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
		
		NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
		[numberFormatter setPositiveFormat:@"#,##0.## bytes"];
		
		NSDictionary *fileAttributes =
			[[NSFileManager defaultManager] fileAttributesAtPath:self.filePath
													traverseLink:YES];
		NSDate *modificationDate = (NSDate *)[fileAttributes objectForKey:NSFileModificationDate];
		NSNumber *fileSize = (NSNumber *)[fileAttributes objectForKey:NSFileSize];
		fileSizeLabel.text = [numberFormatter stringFromNumber:fileSize];
		fileModifiedLabel.text = [dateFormatter stringFromDate:modificationDate];
		
		[numberFormatter release];
		[dateFormatter release];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
