//
//  TableData.h
//  TabbarTest
//
//  Created by Lin Dennis on 13/8/1.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableData : NSObject

@property(nonatomic,retain) NSString *Title;
@property(nonatomic,retain) NSString *SubTitle;

+(TableData*)ItemWithTitle:(NSString*) title SubTitle:(NSString*) subtitle;

@end
