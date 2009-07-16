//
//  MovieViewController.h
//  Movie
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class MovieEditorViewController;

@interface MovieViewController : UIViewController {
	Movie *movie;
	UILabel *titleLabel;
	UILabel *boxOfficeGrossLabel;
	UILabel *summaryLabel;
	MovieEditorViewController *editingViewController;
}

@property(nonatomic, retain) Movie *movie;
@property(nonatomic, retain) IBOutlet UILabel *titleLabel;
@property(nonatomic, retain) IBOutlet UILabel *boxOfficeGrossLabel;
@property(nonatomic, retain) IBOutlet UILabel *summaryLabel;
@property(nonatomic, retain) IBOutlet MovieEditorViewController *editingViewController;

- (IBAction)edit;

@end

