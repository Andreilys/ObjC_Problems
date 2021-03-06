//
//  BNRItemsDetailViewController.h
//  HomePwner
//
//  Created by Andrei on 6/15/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController <UIViewControllerRestoration>
-(instancetype)initForNewItem:(BOOL)isNew;
@property (nonatomic, copy) void (^dismissBlock)(void);

@property (nonatomic, strong) BNRItem *item;

@end
