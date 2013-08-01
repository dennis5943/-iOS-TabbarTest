//
//  TableData.m
//  TabbarTest
//
//  Created by Lin Dennis on 13/8/1.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import "TableData.h"

@implementation TableData

+(TableData *)ItemWithTitle:(NSString *)title SubTitle:(NSString *)subtitle
{
    TableData *item = [[TableData alloc]init];
    [item setTitle:title];
    [item setSubTitle:subtitle];
    
    return item;
}

@end
