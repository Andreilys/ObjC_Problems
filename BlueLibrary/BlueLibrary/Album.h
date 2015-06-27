//
//  Album.h
//  BlueLibrary
//
//  Created by Andrei on 6/25/15.
//  Copyright (c) 2015 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, copy, readonly) NSString *title, *artist, *genre, *coverUrl, *year;

-(id)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrl:(NSString *)coverUrl year:(NSString *) year;
@end
