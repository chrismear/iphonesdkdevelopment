//
//  Movie.h
//  Movie
//
//  Created by Chris Mear on 16/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Movie : NSObject {
	NSString *title;
	NSNumber *boxOfficeGross;
	NSString *summary;
}

- (id)initWithTitle:(NSString *)newTitle
	 boxOfficeGross:(NSNumber *)newBoxOfficeGross
			summary:(NSString *)newSummary;

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSNumber *boxOfficeGross;
@property(nonatomic, copy) NSString *summary;

@end
