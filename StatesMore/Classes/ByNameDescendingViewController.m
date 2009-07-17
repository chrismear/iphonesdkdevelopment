//
//  ByNameDescendingViewController.m
//  States
//
//  Created by Bill Dudney on 7/24/08.
//  Copyright 2008 Gala Factory. All rights reserved.
//
//
//  Licensed with the Apache 2.0 License
//  http://apache.org/licenses/LICENSE-2.0
//

#import "ByNameDescendingViewController.h"
#import "StatesAppDelegate.h"

@implementation ByNameDescendingViewController

- (NSArray *)states {
    return [(StatesAppDelegate *)[[UIApplication sharedApplication] delegate] statesDescindingByName];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stateCell"];
    if(nil == cell) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:@"stateCell"] autorelease];
    }
    cell.textLabel.text = [[self.states objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.states.count;
}

@end
