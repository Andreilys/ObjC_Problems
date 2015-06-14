//
//  BNRHypnosisViewController.m
//  
//
//  Created by Andrei on 6/14/15.
//
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void)loadView
{
    //creating a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    //set it as the view of this view controller
    self.view = backgroundView;
}
@end
