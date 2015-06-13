//
//  AppDelegate.h
//  toDoList
//
//  Created by Andrei on 6/13/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *BNRDocPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;
@property (nonatomic) NSMutableArray *tasks;

-(void)addTask: (id)sender;

@end

