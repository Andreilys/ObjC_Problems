//
//  BNRAppliance.h
//  initMethods
//
//  Created by Andrei on 6/14/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

//the designated initializer
-(instancetype)initWithProductName: (NSString *)pn;

@end
