//
//  FirstViewController.m
//  States
//
//  Created by Bill Dudney on 7/23/08.
//  Copyright Gala Factory 2008. All rights reserved.
//
//
//  Licensed with the Apache 2.0 License
//  http://apache.org/licenses/LICENSE-2.0
//

#import "ByPopulationViewController.h"
#import "StatesAppDelegate.h"

@implementation ByPopulationViewController

//START:code.byPop.states
- (NSArray *)states {
  return [(StatesAppDelegate *)[[UIApplication sharedApplication] delegate] 
          statesByPopulation];
}
//END:code.byPop.states

//START:code.byPop.tv
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
  return self.states.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView 
                           dequeueReusableCellWithIdentifier:@"stateCell"];
  if(nil == cell) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"stateCell"] autorelease];
  }
  cell.textLabel.text = [[self.states objectAtIndex:indexPath.row] objectForKey:@"name"];
  return cell;
}
//END:code.byPop.tv

@end
