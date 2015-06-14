//
//  BNROwnedAppliance.h
//  initMethods
//
//  Created by Andrei on 6/14/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRAppliance.h"

@interface BNROwnedAppliance : BNRAppliance
@property (readonly) NSSet *ownerNames;
-(instancetype) initWithProductName:(NSString *)pn firstOwnerName: (NSString *)n;
-(void)addOwnerName:(NSString *)n;
-(void)removeOwnerName:(NSString *)n;

@end
