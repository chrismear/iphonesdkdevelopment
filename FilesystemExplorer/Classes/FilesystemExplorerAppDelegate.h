//
//  FilesystemExplorerAppDelegate.h
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

@class DirectoryViewController;

@interface FilesystemExplorerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	DirectoryViewController *directoryViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet DirectoryViewController *directoryViewController;

@end

