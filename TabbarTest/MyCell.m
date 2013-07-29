//
//  MyCell.m
//  TabbarTest
//
//  Created by Lin Dennis on 13/7/15.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:false animated:animated];

    // Configure the view for the selected state
}

-(IBAction)OnBtnClicked:(id)sender
{
    if(self.cellDelegate != nil && [self.cellDelegate conformsToProtocol:@protocol(MyCellDelegate)])
    {
        if([self.cellDelegate respondsToSelector:@selector(OnMyCustomViewCellButtonClicked:cell:)])
        {
            [self.cellDelegate OnMyCustomViewCellButtonClicked:sender cell:self];
        }
    }
}

@end
