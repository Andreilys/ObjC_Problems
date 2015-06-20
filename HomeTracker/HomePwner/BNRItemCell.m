//
//  BNRItemCell.m
//  HomePwner
//
//  Created by Andrei on 6/20/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//


#import "BNRItemCell.h"

@implementation BNRItemCell

- (IBAction)showImage:(id)sender
{
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end
