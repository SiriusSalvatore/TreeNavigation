//
//  DetailViewController.h
//  TreeNagivationSample
//
//  Created by Sirius on 16/6/6.
//  Copyright © 2016年 Sirius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
