//
//  RootViewController.h
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

@interface DirectoryViewController : UITableViewController {
	NSString *directoryPath;
	NSArray *directoryContents;
}

@property (nonatomic, retain) NSString *directoryPath;
@property (nonatomic, retain) NSArray *directoryContents;

- (void)loadDirectoryContents;

@end
 