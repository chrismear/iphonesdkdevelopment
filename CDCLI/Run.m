//
//  Run.m
//  CDCLI
//
//  Created by Chris Mear on 23/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "Run.h"


@implementation Run

@dynamic date, primitiveDate;

- (int)processID
{
	[self willAccessValueForKey:@"processID"];
	NSInteger pid = processID;
	[self didAccessValueForKey:@"processID"];
	return pid;
}

- (void)setProcessID:(int)newProcessID
{
	[self willChangeValueForKey:@"processID"];
	processID = newProcessID;
	[self didChangeValueForKey:@"processID"];
}

- (void)setNilValueForKey:(NSString *)key {
	if ([key isEqualToString:@"processID"]) {
		self.processID = 0;
	} else {
		[super setNilValueForKey:key];
	}
}

- (void)awakeFromInsert
{
	[super awakeFromInsert];
	self.primitiveDate = [NSDate date];
}

@end
