//
//  StatesAppDelegate.m
//  States
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "StatesAppDelegate.h"


@implementation StatesAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize states;

- (void)createData {
	NSMutableArray *data = [NSMutableArray array];
	
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:36553215], @"population", 
					 @"California", @"name", 
					 [NSNumber numberWithInt:163770], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:23904380], @"population",
					 @"Texas", @"name", 
					 [NSNumber numberWithInt:268601], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:19297729], @"population", 
					 @"New York", @"name", 
					 [NSNumber numberWithInt:54475], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:18251243], @"population",
					 @"Florida", @"name", 
					 [NSNumber numberWithInt:65758], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:12852548], @"population", 
					 @"Illinois", @"name", 
					 [NSNumber numberWithInt:57918], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:683478], @"population", 
					 @"Alaska", @"name", 
					 [NSNumber numberWithInt:656425], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:957861], @"population", 
					 @"Montana", @"name", 
					 [NSNumber numberWithInt:147046], @"area", nil]];
	[data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
					 [NSNumber numberWithInt:1969915], @"population",
					 @"New Mexico", @"name",
					 [NSNumber numberWithInt:121593], @"area", nil]];
	
	self.states = [NSArray arrayWithArray:data];
}

- (NSArray *)statesByPopulation
{
	NSLog(@"returning statesByPopulation");
	NSRange range = NSMakeRange(0, 5);
	return [self.states subarrayWithRange:range];
}

- (NSArray *)statesByArea
{
	NSLog(@"returning statesByArea");
	NSSortDescriptor *sorter = [[[NSSortDescriptor alloc] initWithKey:@"area" ascending:NO] autorelease];
	NSArray *sorted = [self.states sortedArrayUsingDescriptors:[NSArray arrayWithObject:sorter]];
	NSRange range = NSMakeRange(0, 5);
	return [sorted subarrayWithRange:range];
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:tabBarController.view];
	[self createData];
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

