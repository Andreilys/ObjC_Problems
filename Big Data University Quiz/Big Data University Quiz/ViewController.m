//
//  ViewController.m
//  Big Data University Quiz
//
//  Created by Andrei on 6/19/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"
#import "QuizDetailedController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)sparkFundamentals:(id)sender {
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //Here I am testing to see if the seque is the one I want
    if([segue.identifier isEqualToString:@"showQuizDetail"]){
        //I need to initalize the "quizdetailedcontroller object, as it has the methods I need in order to pass information
        QuizDetailedController *controller = (QuizDetailedController*)segue.destinationViewController;
        UIButton *button = (UIButton*)sender;
        //here I'm able to check the tags and see which button I should go with
        if (button.tag == 1) {
            controller.quiz = @"Spark Fundamentals";
            
        } else if (button.tag == 2) {
            NSLog(@"works");
            controller.quiz = @"Hadoop";
        } else {
            //TODO: Code here...
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
