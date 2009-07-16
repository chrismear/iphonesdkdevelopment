//
//  RootViewController.h
//  MovieTable
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "Movie.h";
@class MovieEditorViewController;
@class Movie;

@interface RootViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
	NSMutableArray *moviesArray;
	MovieEditorViewController *movieEditor;
	Movie *editingMovie;
}

@property(nonatomic, retain) IBOutlet MovieEditorViewController *movieEditor;

- (IBAction)handleAddTapped;

@end
