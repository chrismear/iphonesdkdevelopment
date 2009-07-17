//
//  CreateDirectoryViewController.h
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DirectoryViewController;

@interface CreateDirectoryViewController : UIViewController {
	NSString *parentDirectoryPath;
	DirectoryViewController *directoryViewController;
	
	UITextField *directoryNameField;
}

@property (nonatomic, retain) NSString *parentDirectoryPath;
@property (nonatomic, retain) DirectoryViewController *directoryViewController;
@property (nonatomic, retain) IBOutlet UITextField *directoryNameField;

@end
