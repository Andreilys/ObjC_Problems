//
//  newPerson.m
//  Person Class
//
//  Created by Andrei on 6/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "newPerson.h"


@implementation newPerson



-(float)bodyMassIndex
{
    float h = [self heightInMeters];
    return _weightInKilos / h*h;
}


@end
