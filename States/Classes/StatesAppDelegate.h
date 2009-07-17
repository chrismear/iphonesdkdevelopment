//
//  StatesAppDelegate.h
//  States
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatesAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    IBOutlet UIWindow *window;
    IBOutlet UITabBarController *tabBarController;
	NSArray *states;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) NSArray *states;

- (NSArray *)statesByPopulation;
- (NSArray *)statesByArea;

@end
