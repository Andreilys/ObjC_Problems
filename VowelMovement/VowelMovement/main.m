//
//  main.m
//  VowelMovement
//
//  Created by Andrei on 6/12/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Creating an array of string and a container for devowlized ones
        
        NSArray *originalStrings = @[@"Saurkraut", @"Raygun", @"Big Nerd Ranch", @"Missisipi"];
        
        NSLog(@"Original strings: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        //Create a list of characters to be removed from the string
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        [originalStrings enumerateObjectsUsingBlock: ^(id string, NSUInteger i, BOOL *stop)
         {
             NSMutableString *newString = [NSMutableString stringWithString:string];
             
             //iterate over the array of vowels, replacing occurences of each
             for(NSString *s in vowels){
                 NSRange fullRange = NSMakeRange(0, [newString length]);
                 [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
                 
                 [devowelizedStrings addObject: newString];
             }//End of block assignment
         }
         ];
        NSLog(@"devowelized strings: %@", devowelizedStrings);
    }
    return 0;
}
