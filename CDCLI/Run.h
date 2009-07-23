//
//  Run.h
//  CDCLI
//
//  Created by Chris Mear on 23/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Run : NSManagedObject {
	NSInteger processID;
}

@property (retain) NSDate *date;
@property (retain) NSDate *primitiveDate;
@property NSInteger processID;

@end
