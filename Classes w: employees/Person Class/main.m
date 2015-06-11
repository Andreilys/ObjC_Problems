//
//  main.m
//  Person Class
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAssets.h"

void println(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    
    CFShow((__bridge CFStringRef)[[NSString alloc] initWithFormat:format arguments:args]);
    
    va_end(args);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // initiatializing employees array
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *executives = NSMutableDictionary.alloc.init;
        
        
        
        //create 10 employee objects called mikey
        for (int i =0; i<10; i++){
            BNREmployee *mikey = [[BNREmployee alloc] init];
            
            mikey.weightInKilos = 90+i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            
            
            [employees addObject:mikey];
            
            if (i==0) {
                [executives setObject:mikey forKey:@"CEO"];
            }
            
            if (i==1) {
                [executives setObject:mikey forKey:@"CTO"];
            }
            
            
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        //create 10 laptop object assets
        for (int i=0; i<10; i++){
            BNRAssets *asset = [[BNRAssets alloc] init];
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i *17;
            
            //creates a random number between 0 and 9 inclusive (since theres only 10 employees)
            NSUInteger randomIndex = random() %[employees count];
            
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            [randomEmployee addAsset:asset];
            
            [allAssets addObject:asset];
        }
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        [employees sortUsingDescriptors: @[voa, eid]];
        
        
        println(@"Employees: %@", employees);
        println(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        
        println(@"all assets: %@", allAssets);
        
        println(@"executives: %@",executives);
        
        println(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        println(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        
        println(@"Giving up all employees");
        
        allAssets = nil;
        employees = nil;
    

        
    
    }
    sleep(100);
    return 0;
}
