//
//  HelloUserViewController.h
//  HelloUser
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloUserViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UILabel *helloLabel;
	IBOutlet UITextField *nameField;
}

- (IBAction) sayHello:(id)sender;

@property (nonatomic, retain) UILabel *helloLabel;
@property (nonatomic, retain) UITextField *nameField;

@end

