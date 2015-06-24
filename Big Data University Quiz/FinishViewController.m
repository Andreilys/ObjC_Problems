//
//  FinishViewController.m
//  Big Data University Quiz
//
//  Created by Andrei on 6/24/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "FinishViewController.h"

@interface FinishViewController ()


@end


@implementation FinishViewController

- (IBAction)home:(id)sender {
    [self.navigationController popToRootViewControllerAnimated: NO]; 
}

- (void)viewDidLoad {
        [super viewDidLoad];
        NSString *fullURL = @"https://bigdatauniversity.com/courses/auth/openid/login.php";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:requestObj];
    NSLog(@"complete");
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
