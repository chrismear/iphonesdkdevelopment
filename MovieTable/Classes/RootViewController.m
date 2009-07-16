//
//  RootViewController.m
//  MovieTable
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "RootViewController.h"
#import "MovieEditorViewController.h"

@implementation RootViewController

@synthesize movieEditor;
@synthesize sortControl;

- (void)sortMoviesArray
{
	NSSortDescriptor *sorter;
	switch (sortControl.selectedSegmentIndex) {
		case 0: // sort alpha ascending
			sorter = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
			break;
		case 1: // sort alpha descending
			sorter = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
			break;
		case 2: // sort $$ ascending
			sorter = [[NSSortDescriptor alloc] initWithKey:@"boxOfficeGross" ascending:YES];
			break;
	};
	NSArray *sortDescriptors = [NSArray arrayWithObject:sorter];
	[moviesArray sortUsingDescriptors:sortDescriptors];
	[sorter release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	moviesArray = [[NSMutableArray alloc] init];
	
	Movie *aMovie = [[Movie alloc] init];
	aMovie.title = @"Plaything Anecdote";
	aMovie.boxOfficeGross = [NSNumber numberWithInt:191796233];
	aMovie.summary = @"Did you every think your dolls were really alive? Well, they are.";
	[moviesArray addObject:aMovie];
	[aMovie release];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	if (editingMovie) {
		NSIndexPath *updatedPath = [NSIndexPath indexPathForRow:[moviesArray indexOfObject:editingMovie] inSection:0];
		NSArray *updatedPaths = [NSArray arrayWithObject:updatedPath];
		[self.tableView reloadRowsAtIndexPaths:updatedPaths withRowAnimation:NO];
		editingMovie = nil;
	}
	
	[self sortMoviesArray];
	[self.tableView reloadData];
}

- (IBAction)handleAddTapped
{
	Movie* newMovie = [[Movie alloc] init];
	editingMovie = newMovie;
	movieEditor.movie = editingMovie;
	[self.navigationController pushViewController:movieEditor animated:YES];
	[moviesArray addObject:newMovie];
	NSIndexPath *newMoviePath = [NSIndexPath indexPathForRow:([moviesArray count] - 1) inSection:0];
	NSArray *newMoviePaths = [NSArray arrayWithObject:newMoviePath];
	[self.tableView insertRowsAtIndexPaths:newMoviePaths withRowAnimation:NO];
}

- (IBAction)handleSortChanged
{
	[self sortMoviesArray];
	[self.tableView reloadData];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [moviesArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"MovieTableCell" owner:self options:NULL];
		cell = nibLoadedCell;
    }
    
	// Configure the cell.
	Movie *aMovie = [moviesArray objectAtIndex:indexPath.row];
	UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
	titleLabel.text = aMovie.title;
	UILabel *boxOfficeLabel = (UILabel *)[cell viewWithTag:2];
	boxOfficeLabel.text = [NSString stringWithFormat:@"%d", [aMovie.boxOfficeGross intValue]];
	UILabel *summaryLabel = (UILabel *)[cell viewWithTag:3];
	summaryLabel.text = aMovie.summary;

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	editingMovie = [moviesArray objectAtIndex:indexPath.row];
	movieEditor.movie = editingMovie;
	[self.navigationController pushViewController:movieEditor animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		[moviesArray removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

