//
//  BNRPortfolio.h
//  Stocks
//
//  Created by Andrei on 6/10/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStocks;

@interface BNRPortfolio : NSObject

@property (nonatomic, copy) NSArray *stockHolding;
-(void)addStockHolding:(BNRStocks *)s;
-(float)valueInDollars;
-(NSArray *) sortUsingValue;

@end
