//
//  BNREmployee.m
//  Person Class
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAssets.h"

@interface BNREmployee ()
{
    NSMutableSet *_assets;
}
    @property (nonatomic) unsigned int officeAlarmCode;
@end

@implementation BNREmployee

-(void) setAssets:(NSSet *)a
{
    _assets = [a mutableCopy];
}

-(NSArray *)assets{
    return [_assets copy];
}

-(void)addAsset:(BNRAssets *)a
{
    if (!_assets){
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
    a.holder = self;
}

-(unsigned int)valueOfAssets
{
    unsigned int sum = 0;
    for (BNRAssets *a in _assets){
        sum += [a resaleValue];
    }
    return sum;
}




-(double) yearsOfEmployment{
    if (self.hireDate) {
        NSDate *now = NSDate.date;
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0;
    } else {
        return 0;
    }
}

-(float)bodyMassIndex {
    float normalBMI = [super bodyMassIndex];
    return normalBMI*0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

-(void) dealloc
{
    NSLog(@"deallocating %@", self);
}
            
@end
