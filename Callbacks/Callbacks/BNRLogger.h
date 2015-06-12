//
//  BNRLogger.h
//  Callbacks
//
//  Created by Andrei on 6/11/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject
    <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime;

- (NSString *) lastTimeString;
- (void) updateLastTime: (NSTimer *)t;
-(void) zoneChange:(NSNotification *)note;


@end
