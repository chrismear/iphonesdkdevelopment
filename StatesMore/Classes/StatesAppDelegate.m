//
//  StatesAppDelegate.m
//  States
//
//  Created by Bill Dudney on 7/23/08.
//  Copyright Gala Factory 2008. All rights reserved.
//
//
//  Licensed with the Apache 2.0 License
//  http://apache.org/licenses/LICENSE-2.0
//

#import "StatesAppDelegate.h"


@implementation StatesAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize states;

- (void)createData {
  //START:code.states.california
  NSMutableArray *data = [NSMutableArray array];
  
  [data addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNumber numberWithInt:36553215], @"population", 
                   @"California", @"name", 
                   [NSNumber numberWithInt:163770], @"area", nil]];
  //END:code.states.california
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

//START:code.states.populationOrder
- (NSArray *)statesByPopulation {
  NSRange range = NSMakeRange(0, 5);
  return [self.states subarrayWithRange:range];
}
//END:code.states.populationOrder

//START:code.states.areaDescOrder
- (NSArray *)statesByDescArea {
    NSSortDescriptor *sorter = [[[NSSortDescriptor alloc]
                                 initWithKey:@"area" ascending:NO] autorelease];
    NSArray *sorted = [self.states sortedArrayUsingDescriptors:
                       [NSArray arrayWithObject:sorter]];
    NSRange range = NSMakeRange(0, 5);
    return [sorted subarrayWithRange:range];
}
//END:code.states.areaDescOrder

//START:code.states.areaAscOrder
- (NSArray *)statesByAscArea {
    NSSortDescriptor *sorter = [[[NSSortDescriptor alloc]
                                 initWithKey:@"area" ascending:YES] autorelease];
    NSArray *sorted = [self.states sortedArrayUsingDescriptors:
                       [NSArray arrayWithObject:sorter]];
    NSRange range = NSMakeRange(0, 5);
    return [sorted subarrayWithRange:range];
}
//END:code.states.areaAscOrder

//START:code.states.descNameOrder
- (NSArray *)statesDescindingByName {
    NSSortDescriptor *sorter = [[[NSSortDescriptor alloc]
                                 initWithKey:@"name" ascending:NO] autorelease];
    NSArray *sorted = [self.states sortedArrayUsingDescriptors:
                       [NSArray arrayWithObject:sorter]];
    NSRange range = NSMakeRange(0, 5);
    return [sorted subarrayWithRange:range];
}
//END:code.states.descNameOrder

//START:code.states.ascNameOrder
- (NSArray *)statesAscendingByName {
    NSSortDescriptor *sorter = [[[NSSortDescriptor alloc]
                                 initWithKey:@"name" ascending:YES] autorelease];
    NSArray *sorted = [self.states sortedArrayUsingDescriptors:
                       [NSArray arrayWithObject:sorter]];
    NSRange range = NSMakeRange(0, 5);
    return [sorted subarrayWithRange:range];
}
//END:code.states.ascNameOrder

//START:code.states.ascPopulation
- (NSArray *)statesAscendingByPopulation {
    NSSortDescriptor *sorter = [[[NSSortDescriptor alloc]
                                 initWithKey:@"population" ascending:YES] autorelease];
    NSArray *sorted = [self.states sortedArrayUsingDescriptors:
                       [NSArray arrayWithObject:sorter]];
    NSRange range = NSMakeRange(0, 5);
    return [sorted subarrayWithRange:range];
}
//END:code.states.ascPopulation

//START:code.states.appDidFinish
- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[window addSubview:tabBarController.view];
  [self createData];
}
//END:code.states.appDidFinish

- (void)dealloc {
  self.tabBarController = nil;
  self.window = nil;
  self.states = nil;
	[super dealloc];
}

@end

