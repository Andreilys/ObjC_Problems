//
//  BNRItemStore.h
//  HomePwner
//
//  Created by Andrei on 6/15/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//


#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;

- (void)moveItemAtIndex:(NSInteger)fromIndex
                toIndex:(NSInteger)toIndex;

@end
