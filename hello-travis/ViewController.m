//
//  ViewController.m
//  hello-travis
//
//  Created by Karol Szafrański on 18.11.17.
//  Copyright © 2017 dstrct.in. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel* helloWorldLabel;
@property (weak, nonatomic) IBOutlet UILabel* currentIpAddressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.helloWorldLabel.text = @"Hello Travis";
    self.currentIpAddressLabel.text = @"0.0.0.0";
    self.currentIpAddressLabel.font = [UIFont italicSystemFontOfSize:[UIFont smallSystemFontSize]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
