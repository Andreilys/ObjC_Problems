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


- (void)viewDidLoad {
    [super viewDidLoad];
    if(_quiz){
        self.quizLabel.text = [NSString stringWithFormat:@"%@", _quiz];
    }
    // Do any additional setup after loading the view.
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
