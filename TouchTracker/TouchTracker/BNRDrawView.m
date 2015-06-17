//
//  BNRDrawView.m
//  
//
//  Created by Andrei on 6/16/15.
//
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView()

<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *moveRecognizer;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, weak) BNRLine *selectedLine;

@end

@implementation BNRDrawView

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        for (UITouch *t in touches){
            CGPoint location = [t locationInView:self];
            BNRLine *line = [[BNRLine alloc]init];
            line.begin = location;
            line.end = location;
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            self.linesInProgress[key] = line;
        }
        
    [self setNeedsDisplay];

}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
     
     [self setNeedsDisplay];
    
}
-(instancetype) initWithFrame:(CGRect)r
{
    self = [super initWithFrame:r];
    if(self){
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap: )];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognizer];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        tapRecognizer.delaysTouchesBegan = YES;
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        [self addGestureRecognizer:tapRecognizer];
        
        UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress :)];
        [self addGestureRecognizer:pressRecognizer];
        
        self.moveRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveLine:)];
        self.moveRecognizer.delegate = self;
        self.moveRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:self.moveRecognizer];
    }
    return self;
}

-(void)moveLine:(UIPanGestureRecognizer *)gr
{
    //if we do not have a selected line don't do anything
    if (!self.selectedLine) {
        return;
    }
    
    //when the pan recognizer changes its position..
    
    if (gr.state == UIGestureRecognizerStateChanged) {
        //how far has pan moved?
        CGPoint translation = [gr translationInView:self];
        //ad the translation to the current begin and end points of line
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.end;
        begin.x +=translation.x;
        begin.y += translation.y;
        end.x += translation.x;
        end.y += translation.y;
        
        //set the new beginning and end points of line
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
        //redraw the screen
        [self setNeedsDisplay];
        
        [gr setTranslation:CGPointZero inView:self];
    }
}


-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)other
{
    if(gestureRecognizer == self.moveRecognizer){
        return YES;
    }
    return NO;
}


-(void)longPress: (UIGestureRecognizer *)gr
{
    if (gr.state == UIGestureRecognizerStateBegan){
        CGPoint point = [gr locationInView:self];
        self.selectedLine = [self lineAtPoint:point];
        
        if(self.selectedLine) {
            [self.linesInProgress removeAllObjects];
        } else if (gr.state == UIGestureRecognizerStateEnded){
            self.selectedLine = nil;
        }
        [self setNeedsDisplay];
    }
}

-(void)tap:(UIGestureRecognizer *)gr
{
    NSLog(@"Recognized tap");
    
    CGPoint point = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    
    if (self.selectedLine) {
        //Make ourselves the target of menu item action messages
        [self becomeFirstResponder];
        
        //grab the menu controller
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        //create a new "delete uimenu item
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        menu.menuItems = @[deleteItem];
        
        //tell the menu where it should come from and show it
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
    } else {
        //hide the menu if no line is there
        [[UIMenuController sharedMenuController]setMenuVisible:NO animated:YES];
    }
    [self setNeedsDisplay];
}

-(void)deleteLine:(id)sender
{
    //remove the selected line from list
    [self.finishedLines removeObject:self.selectedLine];
    [self setNeedsDisplay];
}


-(void)doubleTap:(UIGestureRecognizer *)gr
{
    NSLog(@"Recognized Double Tap");
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
    
}

-(void)strokeLine:(BNRLine *)line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

-(void)drawRect:(CGRect)rect
{
    [[UIColor blackColor]set];
    for (BNRLine *line in self.finishedLines){
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
    
    if(self.selectedLine) {
        [[UIColor greenColor] set];
        [self strokeLine:self.selectedLine];
    }
}

-(BNRLine *)lineAtPoint:(CGPoint)p
{
    for(BNRLine *l in self.finishedLines){
        CGPoint start = l.begin;
        CGPoint end = l.end;
        //Check a few points on the line
        for(float t=0.0; t<= 1.0; t +=0.05){
            float x = start.x + t*(end.x- start.x);
            float y = start.y + t*(end.y-start.y);
            
            //if the taped point is within 20 points lets return this line
            
            if (hypot(x-p.x, y - p.y) < 20.0){
                 return l;
            }
        }
    }
    //if nothing is close enough we don't selected a line
    return nil;
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

@end
