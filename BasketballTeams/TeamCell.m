//
//  TeamCell.m
//  BasketballTeams
//
//  Created by Chris Mear on 04/02/2009.
//  Copyright 2009 Greenvoice. All rights reserved.
//

#import "TeamCell.h"


@implementation TeamCell

@synthesize nameLabel;
@synthesize divisionLabel;
@synthesize recordLabel;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[nameLabel release];
	[divisionLabel release];
	[recordLabel release];
    [super dealloc];
}


@end
