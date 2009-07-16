//
//  StarterAppDelegate.h
//  Starter
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarterViewController;

@interface StarterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    StarterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet StarterViewController *viewController;

@end

