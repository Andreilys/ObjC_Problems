//
//  main.m
//  vowelCounter
//
//  Created by Andrei on 6/14/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *string = @"Hello, World!";
        NSLog(@"%@ has %d vowels", string, [string bnr_vowelCount]);
    }
    return 0;
}
