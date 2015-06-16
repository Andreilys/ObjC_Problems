//
//  BNRImageStore.h
//  HomePwner
//
//  Created by Andrei on 6/15/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
