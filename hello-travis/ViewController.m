//
//  ViewController.m
//  hello-travis
//
//  Created by Karol Szafrański on 18.11.17.
//  Copyright © 2017 dstrct.in. All rights reserved.
//

#import "ViewController.h"
#import <MyIPAddressKit/MyIpAddressKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel* helloWorldLabel;
@property (weak, nonatomic) IBOutlet UILabel* currentIpAddressLabel;

@property (strong, nonatomic) IPAddressRequest* ipAddressRequest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.helloWorldLabel.text = @"Hello Travis";
    self.currentIpAddressLabel.text = @"0.0.0.0";
    self.currentIpAddressLabel.font = [UIFont italicSystemFontOfSize:[UIFont smallSystemFontSize]];

    self.ipAddressRequest = [[IPAddressRequest alloc] init];
    self.ipAddressRequest.URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    __weak typeof(self) weakSelf = self;
    [self.ipAddressRequest requestWithCompletionHandler:^(NSString * IPAddressString, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", error);
            }
            else {
                weakSelf.currentIpAddressLabel.text = IPAddressString;
            }
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
