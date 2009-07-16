//
//  DVDCaseAppDelegate.m
//  DVDCase
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "DVDCaseAppDelegate.h"
#import "RootViewController.h"


@implementation DVDCaseAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
