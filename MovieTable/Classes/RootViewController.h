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
	IBOutlet UITableViewCell* nibLoadedCell;
	UISegmentedControl *sortControl;
}

@property(nonatomic, retain) IBOutlet MovieEditorViewController *movieEditor;
@property(nonatomic, retain) IBOutlet UISegmentedControl *sortControl;

- (IBAction)handleAddTapped;
- (IBAction)handleSortChanged;

@end
