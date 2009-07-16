//
//  RootViewController.m
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

#import "RootViewController.h"
#import "AddTeamViewController.h"
#import "BasketballTeamsAppDelegate.h"


@implementation RootViewController

@synthesize teams;
@synthesize addButtonItem;

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		self.teams = [NSMutableArray arrayWithObjects:@"Anaheim Aardvarks",
													  @"Baltimore Bats",
													  @"California Caterpillars",
													  @"Denver Donkeys",
													  nil];
		self.addButtonItem = [[[UIBarButtonItem alloc]
							  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
							  target:self
							   action:@selector(addButtonWasPressed)] autorelease];
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = self.addButtonItem;
}

- (IBAction)addButtonWasPressed {
	AddTeamViewController *addTeamViewController;
	addTeamViewController = [[AddTeamViewController alloc] initWithNibName:@"AddTeamViewController" bundle:nil];
	addTeamViewController.rootViewController = self;
	[self.navigationController pushViewController:addTeamViewController animated:YES];
	[addTeamViewController release];
}

- (void)addTeamNamed:(NSString *)teamName {
	[teams addObject:teamName];
	NSIndexPath *indexPath;
	indexPath = [NSIndexPath indexPathForRow:[teams indexOfObject:teamName]	inSection:0];
	[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:NO];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [teams count];
}

- (TeamCell *)createNewTeamCellFromNib {
	NSArray* nibContents = [[NSBundle mainBundle] loadNibNamed:@"TeamCell" owner:self options:nil];
	NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
	TeamCell* teamCell = nil;
	NSObject* nibItem = nil;
	while ( (nibItem = [nibEnumerator nextObject]) != nil) {
		if ( [nibItem isKindOfClass:[TeamCell class]]) {
			teamCell = (TeamCell *)nibItem;
			if ([teamCell.reuseIdentifier isEqualToString:@"Team"]) {
				break;
			} else {
				teamCell = nil;
			}
		}
	}
	return teamCell;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
    static NSString *CellIdentifier = @"Team";
	TeamCell *cell = (TeamCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [self createNewTeamCellFromNib];
	}
	NSString* teamName = [teams objectAtIndex:indexPath.row];
	cell.nameLabel.text = teamName;
	cell.divisionLabel.text = ([teamName length] % 2 == 0) ? @"Eastern" : @"Western";
	cell.recordLabel.text = [[[NSString alloc] initWithFormat:@"%d-%d", [teamName length], 30 - [teamName length]] autorelease];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		[teams removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
	[tableView endUpdates];
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
	[teams release];
	[addButtonItem release];
    [super dealloc];
}


@end

