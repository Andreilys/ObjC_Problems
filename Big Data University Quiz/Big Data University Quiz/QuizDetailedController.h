//
//  QuizDetailedController.h
//  Big Data University Quiz
//
//  Created by Andrei on 6/19/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizDetailedController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *quizLabel;
@property (nonatomic, strong) NSString *quiz;
@property (nonatomic, strong) NSArray *quizQuestionArray;
@property (weak, nonatomic) IBOutlet UILabel *quizQuestions;
@property (nonatomic) BOOL *isSomethingEnabled;

@end
