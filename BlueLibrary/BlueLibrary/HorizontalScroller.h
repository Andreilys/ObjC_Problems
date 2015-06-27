//
//  HorizontalScroller.h
//  BlueLibrary
//
//  Created by Andrei on 6/26/15.
//  Copyright (c) 2015 Eli Ganem. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

@property (weak) id<HorizontalScrollerDelegate> delegate;
-(void)reload;

@end

@protocol HorizontalScrollerDelegate <NSObject>

@required
//ask the delegate how many views he wants to present inside the horizontal scroller
-(NSInteger) numberOfViewForHorizontalScroller:(HorizontalScroller *)scroller;

//-ask the delegate to return the view thats should appear at <index>
-(UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index;

//inform the delegate that the view at <index> has been clicked
-(void)horizontalScroller:(HorizontalScroller*)scroller clickedViewAtIndex:(int)index;

@optional
//ask the delegate for index of initial views to display
-(NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller;

@end