//
//  CreateFileViewController.h
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DirectoryViewController;

@interface CreateFileViewController : UIViewController {
	UITextField *fileNameField;
	UITextView *fileContentsView;
	NSString *parentDirectoryPath;
	DirectoryViewController *directoryViewController;
	NSOutputStream *asyncOutputStream;
	NSData *outputData;
	NSRange outputRange;
}

@property (nonatomic, retain) IBOutlet UITextField *fileNameField;
@property (nonatomic, retain) IBOutlet UITextView *fileContentsView;
@property (nonatomic, retain) NSString *parentDirectoryPath;
@property (nonatomic, retain) DirectoryViewController *directoryViewController;

@end 