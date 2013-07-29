//
//  MyCell.h
//  TabbarTest
//
//  Created by Lin Dennis on 13/7/15.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyCellDelegate;
@interface MyCell : UITableViewCell

@property(nonatomic,retain) IBOutlet UIImageView* imgView;
@property(nonatomic,retain) IBOutlet UILabel *titleView;
@property(nonatomic,retain) IBOutlet UIButton *btnChange;

@property(nonatomic,retain) IBOutlet id cellDelegate;

-(IBAction)OnBtnClicked:(id)sender;

@end

@protocol MyCellDelegate

@optional
-(void)OnMyCustomViewCellButtonClicked:(id)sender cell:(MyCell*) cell;

@end
