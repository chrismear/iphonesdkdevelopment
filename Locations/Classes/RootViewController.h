//
//  RootViewController.h
//  Locations
//
//  Created by Chris Mear on 22/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Event.h"


@interface RootViewController : UITableViewController <CLLocationManagerDelegate> {
	NSMutableArray *eventsArray;
	NSManagedObjectContext *managedObjectContext;
	
	CLLocationManager *locationManager;
	UIBarButtonItem *addButton;
}

@property (nonatomic, retain) NSMutableArray *eventsArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) UIBarButtonItem *addButton;

- (void)addEvent;

@end
