//
//  SubTitleController.m
//  TabbarTest
//
//  Created by Lin Dennis on 13/7/15.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import "SubTitleController.h"

@interface SubTitleController ()

@end

@implementation SubTitleController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) btnclick:(UIButton*)sender
{
    [self.label setText:@"hello"];
}

@end
