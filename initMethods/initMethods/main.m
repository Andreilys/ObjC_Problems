//
//  main.m
//  initMethods
//
//  Created by Andrei on 6/14/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        BNRAppliance *a = [[BNRAppliance alloc] init];
        
        NSLog(@"a is %@", a);
        [a setProductName:@"Washing Machine"];
        [a setVoltage:50];
        NSLog(@"a is %@", a);
    
    }
    return 0;
}
