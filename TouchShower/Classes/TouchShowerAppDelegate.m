//
//  TouchShowerAppDelegate.m
//  TouchShower
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "TouchShowerAppDelegate.h"
#import "TouchShowerViewController.h"

@implementation TouchShowerAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
