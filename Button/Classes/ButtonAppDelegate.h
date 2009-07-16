//
//  ButtonAppDelegate.h
//  Button
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonViewController;

@interface ButtonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ButtonViewController *viewController;

@end

