//
//  StatesAppDelegate.h
//  States
//
//  Created by Bill Dudney on 7/23/08.
//  Copyright Gala Factory 2008. All rights reserved.
//
//
//  Licensed with the Apache 2.0 License
//  http://apache.org/licenses/LICENSE-2.0
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

@property(nonatomic, readonly) NSArray *statesByPopulation;
@property(nonatomic, readonly) NSArray *statesByDescArea;

@property(nonatomic, readonly) NSArray *statesDescindingByName;
@property(nonatomic, readonly) NSArray *statesAscendingByName;
@property(nonatomic, readonly) NSArray *statesAscendingByPopulation;
@property(nonatomic, readonly) NSArray *statesByAscArea;
    
@end
