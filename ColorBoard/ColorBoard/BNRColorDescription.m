//
//  BNRColorDescription.m
//  ColorBoard
//
//  Created by Andrei on 6/22/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

-(instancetype)init
{
    self = [super init];
    if(self){
        _color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
