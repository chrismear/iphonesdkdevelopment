//
//  RootViewController.h
//  DVDCase
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright Greenvoice 2009. All rights reserved.
//

@class DVDCabinetController;

@interface RootViewController : UITableViewController {
	DVDCabinetController *cabinetController;
}

@property(nonatomic, retain) IBOutlet DVDCabinetController *cabinetController;

@end
