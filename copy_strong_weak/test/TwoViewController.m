//
//  TwoViewController.m
//  test
//
//  Created by CityMedia on 2019/3/6.
//  Copyright © 2019年 free. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController
-(void)dealloc{
     NSLog(@"---%s---",__func__);
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"disapper retain count = %ld",CFGetRetainCount((__bridge CFTypeRef)(self)));

}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"did load retain count = %ld",CFGetRetainCount((__bridge CFTypeRef)(self)));
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)clickOne:(id)sender {
    
}

@end
