//
//  FilesystemExplorerAppDelegate.m
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "FilesystemExplorerAppDelegate.h"
#import "DirectoryViewController.h"


@implementation FilesystemExplorerAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize directoryViewController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	
	// Populate the first view
	directoryViewController.directoryPath = NSHomeDirectory();
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

