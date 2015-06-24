//
//  QuizDetailedController.m
//  Big Data University Quiz
//
//  Created by Andrei on 6/19/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "QuizDetailedController.h"
#import "FinishViewController.h"

@interface QuizDetailedController () <UIAlertViewDelegate>

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



- (IBAction)answerPressed:(id)sender {
    //when button is pressed we need to get the senders title in order to compare to the answer array (which will have a.,b.,c.,d.
    UIButton *resultButton = (UIButton *)sender;
    if ([resultButton.currentTitle isEqual:_realAnswerArray[count]]) {
        score++;
        self.realAnswer.text = [NSString stringWithFormat:@"Correct: %d, Incorrect: %d", score, incorrect];
    } else {
        incorrect++;
        self.realAnswer.text = [NSString stringWithFormat:@"Correct: %d, Incorrect: %d", score, incorrect];
    }
    
    count++;
    //reset for new questions
    if(count < [_quizQuestionArray count]){
        self.quizQuestions.text = [NSString stringWithFormat:@"%@", _quizQuestionArray[count]];
        self.answerA.text = [NSString stringWithFormat:@"%@", _answeraArray[count]];
        self.answerB.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
        self.answerC.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
        self.answerD.text = [NSString stringWithFormat:@"%@", _answerbArray[count]];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                       message:(@"Congratulations! You've finished the quiz. Click the Home button to return to the screen, or the BDU button to review content on our website.")
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"BDU" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                                  FinishViewController *viewController = (FinishViewController *)[storyboard instantiateViewControllerWithIdentifier:@"UIWebView"];
                                                                  [self presentViewController:viewController animated:YES completion:nil];
                                                              }];
        
        UIAlertAction* homeAction = [UIAlertAction actionWithTitle:@"Home" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

                                                              }];



    
        [alert addAction:homeAction];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
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
    incorrect = 0;
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
