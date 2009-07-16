//
//  MovieTableAppDelegate.h
//  MovieTable
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

@interface MovieTableAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

