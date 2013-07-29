//
//  SubTitleController.h
//  TabbarTest
//
//  Created by Lin Dennis on 13/7/15.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTitleController : UIViewController

@property(nonatomic,retain) IBOutlet UILabel *label;
@property(nonatomic,retain) IBOutlet UIButton *btn;

-(IBAction) btnclick:(UIButton*)sender;

@end
