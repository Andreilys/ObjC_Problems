//
//  QuizDetailedController.h
//  Big Data University Quiz
//
//  Created by Andrei on 6/19/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizDetailedController : UIViewController


//answer arrays
@property (nonatomic, strong) NSArray *answeraArray;
@property (nonatomic, strong) NSArray *answerbArray;
@property (nonatomic, strong) NSArray *answercArray;
@property (nonatomic, strong) NSArray *answerdArray;
@property (nonatomic, strong) NSArray *realAnswerArray;

@property (nonatomic, strong) IBOutlet UILabel *quizLabel;
@property (nonatomic, strong) NSString *quiz;
@property (nonatomic, strong) NSArray *quizQuestionArray;

@property (weak, nonatomic) IBOutlet UILabel *quizQuestions;
@property (weak, nonatomic) IBOutlet UILabel *answerA;
@property (weak, nonatomic) IBOutlet UILabel *answerB;
@property (weak, nonatomic) IBOutlet UILabel *answerC;
@property (weak, nonatomic) IBOutlet UILabel *answerD;
@property (weak, nonatomic) IBOutlet UILabel *realAnswer;



@end
