//
//  webViewController.m
//  map_WebView
//
//  Created by Shota Oda on 2014/05/27.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *myURL = [NSURL URLWithString:@"http://www.yahoo.co.jp/"];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [self.mywebView loadRequest:myURLReq];
    self.mywebView.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication
     sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication
     sharedApplication].networkActivityIndicatorVisible = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self.mywebView goBack];
}

- (IBAction)next:(id)sender {
    [self.mywebView goForward];
}

- (IBAction)stop:(id)sender {
    [self.mywebView stopLoading];
}

- (IBAction)reload:(id)sender {
    [self.mywebView reload];
}
@end
