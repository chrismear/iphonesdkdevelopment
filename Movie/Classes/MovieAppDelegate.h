//
//  MovieAppDelegate.h
//  Movie
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieViewController;

@interface MovieAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MovieViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MovieViewController *viewController;

@end

