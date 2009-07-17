//
//  FileContentsViewController.m
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "FileContentsViewController.h"


@implementation FileContentsViewController

@synthesize filePath;
@synthesize fileContentsTextView;

- (void)appendTextToView:(NSString *)textToAppend
{
	fileContentsTextView.text = [NSString stringWithFormat:@"%@%@",
								 fileContentsTextView.text, textToAppend];
}

- (void)setUpAsynchronousContentLoad
{
	[asyncInputStream release];
	asyncInputStream = [[NSInputStream alloc] initWithFileAtPath:filePath];
	[asyncInputStream setDelegate:self];
	[asyncInputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[asyncInputStream open];
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent
{
	NSInputStream *inputStream = (NSInputStream *)theStream;
	switch (streamEvent) {
		case NSStreamEventHasBytesAvailable: {
			NSInteger maxLength = 128;
			uint8_t readBuffer [maxLength];
			NSInteger bytesRead = [inputStream read:readBuffer maxLength:maxLength];
			if (bytesRead > 0) {
				NSString *bufferString = [[NSString alloc]
										  initWithBytesNoCopy:readBuffer
										  length:bytesRead
										  encoding:NSUTF8StringEncoding
										  freeWhenDone:NO];
				[self appendTextToView:bufferString];
				[bufferString release];
			}
			break;
		}
		case NSStreamEventErrorOccurred: {
			NSError *error = [theStream streamError];
			if (error != NULL) {
				UIAlertView *errorAlert = [[UIAlertView alloc]
										   initWithTitle:[error localizedDescription]
										   message:[error localizedFailureReason]
										   delegate:nil
										   cancelButtonTitle:@"OK"
										   otherButtonTitles:nil];
				[errorAlert show];
				[errorAlert release];
			}
			[inputStream removeFromRunLoop:[NSRunLoop currentRunLoop]
								   forMode:NSDefaultRunLoopMode];
			[theStream close];
			break;
		}
		case NSStreamEventEndEncountered: {
			[inputStream removeFromRunLoop:[NSRunLoop currentRunLoop]
								   forMode:NSDefaultRunLoopMode];
			[theStream close];
		}
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
	[self setUpAsynchronousContentLoad];
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

- (void)viewWillDisappear:(BOOL)animated
{
	[asyncInputStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
	[asyncInputStream close];
	[super viewWillDisappear:animated];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
