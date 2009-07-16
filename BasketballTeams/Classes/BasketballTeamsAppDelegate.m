//
//  BasketballTeamsAppDelegate.m
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "BasketballTeamsAppDelegate.h"
#import "RootViewController.h"


@implementation BasketballTeamsAppDelegate

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
