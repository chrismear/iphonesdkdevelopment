//
//  EditorViewController.h
//  Starter
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditorViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *field;
}

@property(nonatomic, retain) UITextField *field;

@end
