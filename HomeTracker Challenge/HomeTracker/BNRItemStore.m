//
//  BNRItemStore.m
//  HomeTracker
//
//  Created by Andrei on 6/15/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    //Do I need to create a store?
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

//if programmer calls bnritem alloc init, let him know the error
-(instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

//the real (Secret) intializer
-(instancetype)initPrivate
{
    self = [super init];
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)allItems
{
    return self.privateItems;
}

- (BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

@end
