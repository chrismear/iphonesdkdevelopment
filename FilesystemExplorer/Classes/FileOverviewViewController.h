//
//  FileOverviewViewController.h
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FileOverviewViewController : UIViewController {
	NSString *filePath;
	
	UILabel *fileNameLabel;
	UILabel *fileSizeLabel;
	UILabel *fileModifiedLabel;
}

@property (nonatomic, retain) NSString *filePath;
@property (nonatomic, retain) IBOutlet UILabel *fileNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *fileSizeLabel;
@property (nonatomic, retain) IBOutlet UILabel *fileModifiedLabel;

- (void)updateFileOverview;
- (IBAction)readFileContents;

@end
