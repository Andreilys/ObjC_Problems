//
//  BNRAppliance.m
//  initMethods
//
//  Created by Andrei on 6/14/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

-(instancetype) init
{
    return [self initWithProductName:@"Unknown"];
}

-(instancetype) initWithProductName:(NSString *)pn
{
    if(self = [super init]){
        [self setProductName:pn];
        [self setVoltage:120];
    }
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
}

@end
