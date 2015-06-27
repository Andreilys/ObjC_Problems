//
//  LibraryAPI.h
//  BlueLibrary
//
//  Created by Andrei on 6/25/15.
//  Copyright (c) 2015 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibraryAPI : NSObject

-(NSArray *)getAlbums;
-(void)addAlbum:(Album*)album atIndex:(int)index;
-(void)deleteAlbumAtIndex:(int)index;
+(LibraryAPI *)sharedInstance;

@end
