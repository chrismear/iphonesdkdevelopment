//
//  StarterViewController.h
//  Starter
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"

@class EditorViewController;

@interface StarterViewController : UIViewController {
	IBOutlet UILabel *label;
	IBOutlet EditorViewController *editorViewController;
}

- (IBAction)edit;

@end

