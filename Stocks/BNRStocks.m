//
//  BNRStocks.m
//  Stocks
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRStocks.h"

@implementation BNRStocks

-(float) costInDollars {
    return _numberOfShares * _currentSharePrice;
}

-(float) valueInDollars {
    return _numberOfShares * _purchasedSharePrice;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"<%@: $%f>", self.stockTicker, self.valueInDollars];
}


@end
