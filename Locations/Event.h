//
//  Event.h
//  Locations
//
//  Created by Chris Mear on 22/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Event :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSDate * creationDate;

@end



