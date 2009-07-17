//
//  FileContentsViewController.h
//  FilesystemExplorer
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FileContentsViewController : UIViewController {
	NSString *filePath;
	UITextView *fileContentsTextView;
	NSInputStream *asyncInputStream;
}

@property (nonatomic, retain) NSString *filePath;
@property (nonatomic, retain) IBOutlet UITextView *fileContentsTextView;

@end
