//
//  AddTeamViewController.m
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "AddTeamViewController.h"

@implementation AddTeamViewController

@synthesize rootViewController;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
	teamTextField.returnKeyType = UIReturnKeyDone;
	teamTextField.delegate = self;
    [teamTextField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[rootViewController addTeamNamed:textField.text];
	[textField resignFirstResponder];
	[self.navigationController popViewControllerAnimated:YES];
	return YES;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[rootViewController release];
    [super dealloc];
}


@end
