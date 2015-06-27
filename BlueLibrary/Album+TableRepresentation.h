//
//  Album+TableRepresentation.h
//  BlueLibrary
//
//  Created by Andrei on 6/25/15.
//  Copyright (c) 2015 Eli Ganem. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

-(NSDictionary *)tr_tableRepresentation;

@end
