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

<UITextFieldDelegate>
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
    CGRect frame = [UIScreen mainScreen].bounds;
    //creating a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize Me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    //set it as the view of this view controller
    self.view = backgroundView;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void) drawHypnoticMessage: (NSString *) message
{
    for (int i = 0; i <20; i++){
        UILabel *messageLabel = [[UILabel alloc] init];
        //Configure label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        //This method resize the label which will be relative to the text that its displaying
        
        [messageLabel sizeToFit];
        
        //Getting random x value fitting within hypnosis width
        int width = (int) (self.view.bounds.size
                           .width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        //getting random y value within hypnosis height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        [self.view addSubview:messageLabel];
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.maximumRelativeValue = @(25);
        motionEffect.minimumRelativeValue = @(-25);
        [messageLabel addMotionEffect:motionEffect];
    }
    

    
}

@end
