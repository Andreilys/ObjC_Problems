//
//  QuizDetailedController.m
//  Big Data University Quiz
//
//  Created by Andrei on 6/19/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "QuizDetailedController.h"

@interface QuizDetailedController ()

@end

@implementation QuizDetailedController

//my global variable that keeps track of the number of questions as well as the correct answer
static int count = 0;
static int score = 0;
static int incorrect = 0;

//when home button is pressed, return to home screen
- (IBAction)homeButton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)nextQuestion:(id)sender {
    NSLog(@"works");
    //reset back to gray
    [_answerA setBackgroundColor:[UIColor lightGrayColor]];
    [_answerB setBackgroundColor:[UIColor lightGrayColor]];
    [_answerC setBackgroundColor:[UIColor lightGrayColor]];
    [_answerD setBackgroundColor:[UIColor lightGrayColor]];
    
    if(count < [_quizQuestionArray count]){
        self.quizQuestions.text = [NSString stringWithFormat:@"%@", _quizQuestionArray[count]];
        self.answerA.text = [NSString stringWithFormat:@"%@", _answeraArray[count]];
        self.answerB.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
        self.answerC.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
        self.answerD.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
    } else {
        self.view.backgroundColor = [UIColor blackColor];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //setting the quiz questions for the first round
    self.quizLabel.text = [NSString stringWithFormat:@"%@", _quiz];
    self.quizQuestions.text = [NSString stringWithFormat:@"%@", _quizQuestionArray[count]];
    self.answerA.text = [NSString stringWithFormat:@"%@", _answeraArray[count]];
    self.answerB.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
    self.answerC.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
    self.answerD.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
    NSLog(@"%d, %d, %d,", count, incorrect, score);
}

-(void)viewWillDisappear:(BOOL)animated
{
    _answeraArray = nil;
    _answerbArray = nil;
    _answercArray = nil;
    _answerdArray = nil;
    _quizQuestionArray = nil;
    _realAnswerArray = nil;
    count = 0;
    score = 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
