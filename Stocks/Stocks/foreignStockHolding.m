//
//  foreignStockHolding.m
//  Stocks
//
//  Created by Andrei on 6/10/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "foreignStockHolding.h"

@implementation foreignStockHolding

-(float) costInDollars {
    float cost = [super costInDollars];
    return cost * _conversionRatio;
}

-(float) valueInDollars {
    float value = [super valueInDollars];
    return value *_conversionRatio;
}

@end
