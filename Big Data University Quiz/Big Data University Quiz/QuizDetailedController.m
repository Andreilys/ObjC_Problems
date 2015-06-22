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

//button pressed
- (IBAction)answeraPressed:(id)sender {
    //here whenever count is greater than the current question count, I stop
    UIButton *resultButton = (UIButton *)sender;
    if ([resultButton.currentTitle isEqual:_realAnswerArray[count]]) {
        score++;
        self.realAnswer.text = [NSString stringWithFormat:@"%d", score];
    }
    
    
    if(count < [_quizQuestionArray count] - 1){
        count++;
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
