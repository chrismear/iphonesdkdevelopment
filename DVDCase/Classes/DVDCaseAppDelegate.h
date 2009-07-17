//
//  DVDCaseAppDelegate.h
//  DVDCase
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

@interface DVDCaseAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

