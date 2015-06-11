//
//  BNRAssets.h
//  Person Class
//
//  Created by Andrei on 6/10/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

@interface BNRAssets : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, weak) BNREmployee *holder;
@property (nonatomic) unsigned int resaleValue;

@end
