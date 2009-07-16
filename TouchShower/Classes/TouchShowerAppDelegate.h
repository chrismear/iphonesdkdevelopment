//
//  TouchShowerAppDelegate.h
//  TouchShower
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchShowerViewController;

@interface TouchShowerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchShowerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchShowerViewController *viewController;

@end

