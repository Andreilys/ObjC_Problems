//
//  AlbumView.m
//  BlueLibrary
//
//  Created by Andrei on 6/25/15.
//  Copyright (c) 2015 Eli Ganem. All rights reserved.
//

#import "AlbumView.h"

@implementation AlbumView
{
    UIImageView *coverImage;
    UIActivityIndicatorView *indicator;
}

-(id)initWithFrame:(CGRect)frame albumCover:(NSString *)albumCover
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor blackColor];
        
        //cover image has a 5 px margin from its frame
        coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-10, frame.size.height -10)];
        [self addSubview:coverImage];
        
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [indicator startAnimating];
        [self addSubview:indicator];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BLDownloadImageNotification" object:self userInfo:@{@"imageView":coverImage, @"coverUrl":albumCover}];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
