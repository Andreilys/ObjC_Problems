//
//  BNRAssets.m
//  Person Class
//
//  Created by Andrei on 6/10/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRAssets.h"
#import "BNREmployee.h"

@implementation BNRAssets

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%d>", self.label, self.resaleValue];
    // Is holder non-nil?
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>",
                self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>",
                self.label, self.resaleValue];
    }
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end