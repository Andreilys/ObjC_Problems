//
//  BNRStocks.h
//  Stocks
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStocks : NSObject

@property (nonatomic) float purchasedSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic, copy) NSString *stockTicker;

- (float)costInDollars;
- (float)valueInDollars;

@end
