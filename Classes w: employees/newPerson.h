//
//  newPerson.h
//  Person Class
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

@interface newPerson : NSObject
@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

- (float) bodyMassIndex;
@end
