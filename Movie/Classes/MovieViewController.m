//
//  MovieViewController.m
//  Movie
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieEditorViewController.h"

@implementation MovieViewController

@synthesize movie;
@synthesize titleLabel;
@synthesize boxOfficeGrossLabel;
@synthesize summaryLabel;
@synthesize editingViewController;

- (IBAction)edit
{
	self.editingViewController.movie = self.movie;
	[self presentModalViewController:self.editingViewController animated:YES];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
	Movie *newMovie = [[Movie alloc]
					   initWithTitle:@"Iron Man"
					   boxOfficeGross:[NSNumber numberWithFloat:650000000.00]
					   summary:@"Smart guy makes cool armor"];
	self.movie = newMovie;
	[newMovie release];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.titleLabel.text = self.movie.title;
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	self.boxOfficeGrossLabel.text = [formatter stringFromNumber:self.movie.boxOfficeGross];
	[formatter release];
	self.summaryLabel.text = self.movie.summary;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
