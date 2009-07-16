//
//  MovieEditorViewController.h
//  Movie
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;

@interface MovieEditorViewController : UIViewController <UITextFieldDelegate> {
	UITextField *titleField;
	UITextField *boxOfficeGrossField;
	UITextField *summaryField;
	Movie *movie;
}

@property(nonatomic, retain) IBOutlet UITextField *titleField;
@property(nonatomic, retain) IBOutlet UITextField *boxOfficeGrossField;
@property(nonatomic, retain) IBOutlet UITextField *summaryField;
@property(nonatomic, retain) Movie *movie;

- (IBAction)done;

@end
