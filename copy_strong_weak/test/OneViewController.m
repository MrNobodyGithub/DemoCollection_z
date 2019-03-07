//
//  OneViewController.m
//  test
//
//  Created by CityMedia on 2019/3/6.
//  Copyright © 2019年 free. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()
@end

@implementation OneViewController
- (void)dealloc{
    NSLog(@"---%s---",__func__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [[UIButton alloc] init];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"oneVC  retain count = %ld",CFGetRetainCount((__bridge CFTypeRef)(self)));

    self.block();
    
    
    
    
}



- (void)btnAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
