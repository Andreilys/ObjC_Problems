//
//  BNRLogger.m
//  Callbacks
//
//  Created by Andrei on 6/11/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

-(void) zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed!");
}

// called each time a chunk of data arrives
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"recieved %lu bytes", [data length]);
    
    if (!_incomingData){
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}

//called when the last chunk has been processed
- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
    
    //Uncomment next line to see the entire fetched file
    // NSLog(@"the whole string %@", string);
}

//Called if the fetch fails

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}


- (NSString *) lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle: NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void) updateLastTime: (NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self willChangeValueForKey:@"lastTime"];
    _lastTime = now;
    [self didChangeValueForKey:@"lastTime"];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

@end
