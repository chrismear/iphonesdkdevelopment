//
//  AddTeamViewController.h
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AddTeamViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *teamTextField;
	RootViewController *rootViewController;
}

@property(nonatomic, retain) RootViewController *rootViewController;

@end
