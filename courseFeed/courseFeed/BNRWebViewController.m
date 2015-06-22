//
//  UIWebViewController.m
//  courseFeed
//
//  Created by Andrei on 6/21/15.
//  Copyright (c) 2015 Andrei. All rights reserved._
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

-(void) loadView
{
   UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;

}

-(void)setURL:(NSURL *)URL
{
    _URL = URL;
    if(_URL){
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
