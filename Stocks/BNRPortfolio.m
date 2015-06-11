//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Andrei on 6/10/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRPortfolio.h"
#import "BNRStocks.h"

@interface BNRPortfolio ()
{
    NSMutableArray *_stockHolding;
}
@end

@implementation BNRPortfolio

-(NSArray *) sortUsingValue;
{
    NSSortDescriptor *vid = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    NSArray *holdings = [_stockHolding sortedArrayUsingDescriptors:@[vid]];
    NSRange firstThree = NSMakeRange(0, MIN(3, [holdings count]));
    return [holdings subarrayWithRange:firstThree];
}

//creates and stores a mutable copy in the array
-(void)setStockHolding:(NSArray *)stockHolding
{
    _stockHolding = stockHolding.mutableCopy;
}

//returns the copy from the array of the object
-(NSArray *) stockHolding
{
    return _stockHolding.copy;
}

//initializes the object if it doesn't exist
-(void)addStockHolding:(BNRStocks *)s{
    if(!_stockHolding){
        _stockHolding = NSMutableArray.alloc.init;
    }
    [_stockHolding addObject:s];
}

-(float)valueInDollars
{
    float value = 0;
    for(BNRStocks *s in _stockHolding){
        value += s.valueInDollars;
    }
    return value;
}


@end
