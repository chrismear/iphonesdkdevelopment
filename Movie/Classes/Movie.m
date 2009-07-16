//
//  Movie.m
//  Movie
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "Movie.h"


@implementation Movie

@synthesize title;
@synthesize boxOfficeGross;
@synthesize summary;

- (id)initWithTitle:(NSString *)newTitle
	 boxOfficeGross:(NSNumber *)newBoxOfficeGross
			summary:(NSString *)newSummary
{
	self = [super init];
	if (nil != self) {
		self.title = newTitle;
		self.boxOfficeGross = newBoxOfficeGross;
		self.summary = newSummary;
	}
	return self;
}

-(void) dealloc
{
	self.title = nil;
	self.boxOfficeGross = nil;
	self.summary = nil;
	[super dealloc];
}

@end
