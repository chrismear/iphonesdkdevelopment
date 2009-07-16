//
//  TeamCell.h
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TeamCell : UITableViewCell {
	IBOutlet UILabel* nameLabel;
	IBOutlet UILabel* divisionLabel;
	IBOutlet UILabel* recordLabel;
}

@property (nonatomic, retain) UILabel* nameLabel;
@property (nonatomic, retain) UILabel* divisionLabel;
@property (nonatomic, retain) UILabel* recordLabel;

@end
