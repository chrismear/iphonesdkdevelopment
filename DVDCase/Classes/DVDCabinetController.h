//
//  DVDCabinetController.h
//  DVDCase
//
//  Created by Chris Mear on 17/07/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DVDCabinetController : UIViewController {
	NSDictionary *data;
	NSString *key;
}

@property(nonatomic, retain) NSString *key;

@end
