//
//  ZNavigationController.m
//  NavigationTransitionDemo
//
//  Created by CityMedia on 2018/5/15.
//  Copyright © 2018年 free. All rights reserved.
//

#import "ZNavigationController.h"
#import  "NavigationDelegate.h"
@interface ZNavigationController ()
@property(nonatomic,strong) NavigationDelegate * navDelegate;

@end

@implementation ZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _navDelegate = [[NavigationDelegate alloc] init];
//    self.navigationController.delegate = _navDelegate;
    self.delegate = _navDelegate;
    self.navigationBarHidden = YES;
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
