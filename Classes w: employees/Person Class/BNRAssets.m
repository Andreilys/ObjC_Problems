//
//  BNRAssets.m
//  Person Class
//
//  Created by Andrei on 6/10/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRAssets.h"

@implementation BNRAssets

-(NSString *) description
{
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

-(void) dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
