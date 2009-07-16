//
//  RootViewController.h
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamCell.h"

@interface RootViewController : UITableViewController {
	NSMutableArray *teams;
	UIBarButtonItem *addButtonItem;
}

@property(nonatomic, retain) NSMutableArray *teams;
@property(nonatomic, retain) UIBarButtonItem *addButtonItem;

- (IBAction)addButtonWasPressed;
- (void)addTeamNamed:(NSString *)teamName;

@end
