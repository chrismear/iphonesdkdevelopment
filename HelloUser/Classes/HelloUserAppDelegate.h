//
//  HelloUserAppDelegate.h
//  HelloUser
//
//  Created by Chris Mear on 03/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloUserViewController;

@interface HelloUserAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloUserViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloUserViewController *viewController;

@end

