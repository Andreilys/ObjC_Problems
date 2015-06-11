//
//  main.m
//  Stocks
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "foreignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNRPortfolio *portfolio = BNRPortfolio.alloc.init;
        
        BNRStocks *stock1 = BNRStocks.alloc.init;
        stock1.purchasedSharePrice= 2.50;
        stock1.currentSharePrice = 5.00;
        stock1.numberOfShares = 40;
        [portfolio addStockHolding:stock1];
        
        foreignStockHolding *stock2 = foreignStockHolding.alloc.init;
        stock2.purchasedSharePrice = 5.00;
        stock2.currentSharePrice = 9.00;
        stock2.numberOfShares = 94;
        stock2.conversionRatio = 2;
        [portfolio addStockHolding:stock2];
        
        
        
        NSLog(@"Value of portfolio: $%0.2f", portfolio.valueInDollars);
        
    }
    return 0;
}
                  
