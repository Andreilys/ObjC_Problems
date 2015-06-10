//
//  BNREmployee.h
//  Person Class
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "newPerson.h"
@class BNRAssets;

@interface BNREmployee : newPerson
{
    NSMutableArray *_assets;
}



@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
@property(nonatomic, copy) NSArray *assets;
- (double)yearsOfEmployment;
-(void)addAsset: (BNRAssets *)a;
-(unsigned int)valueOfAssets;

@end
