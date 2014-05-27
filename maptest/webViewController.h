//
//  webViewController.h
//  map_WebView
//
//  Created by Shota Oda on 2014/05/27.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *mywebView;
- (IBAction)back:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)stop:(id)sender;

@end
