//
//  BNRItem.h
//  HomePwner
//
//  Created by Andrei on 6/15/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

<NSCoding>

+ (instancetype)randomItem;

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;
 
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, strong) UIImage *thumbnail;

-(void)setThumbnailFromImage:(UIImage *)image;

@property (nonatomic, copy) NSString *itemKey;

@end
