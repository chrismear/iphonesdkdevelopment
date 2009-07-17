//
//  DVDCaseAppDelegate.m
//  DVDCase
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "DVDCaseAppDelegate.h"
#import "RootViewController.h"


@implementation DVDCaseAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
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

