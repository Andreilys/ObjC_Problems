//
//  BNRQuizViewController.m
//  
//
//  Created by Andrei on 6/14/15.
//
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property(nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes", @"14", @"Montpelier"];
        
        self.tabBarItem.title = @"Quiz Time!";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(IBAction)showQuestion:(id)sender{
    //Step to the next question
        self.currentQuestionIndex++;
    //Am I past the last question?
    if(self.currentQuestionIndex == [self.questions count]){
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = question;
    
    self.answerLabel.text=@"???";
    
}
-(IBAction)showAnswer: (id)sender{
    //What is the answer to the current question?
    
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //Display it in the answer label
    
    self.answerLabel.text = answer;
    
}

@end
