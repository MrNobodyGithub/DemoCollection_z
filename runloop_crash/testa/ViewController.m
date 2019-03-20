//
//  ViewController.m
//  testa
//
//  Created by CityMedia on 2019/3/19.
//  Copyright © 2019年 free. All rights reserved.
//

#import "ViewController.h" 

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self actionA];
}
- (void)actionA{
//    NSArray * arr = @[@"a",@"b",@"c",@"d"];
//    NSLog(@"---%@---",arr[4]);
    
    
    // 测试数组
//    NSArray *arr = @[@"1",@"2",@"3"];
//    NSLog(@"-----%@ --%@",arr[3] ,[arr objectAtIndex:3]);
//    NSMutableArray * mutArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
//    NSLog(@"---%@--%@---",mutArr[3],[mutArr objectAtIndex:3]);
//
    NSString * stra = nil; 
//    NSArray * arrb = @[@"a",stra];
//    NSLog(@"---%@---",arrb);
//    [__NSPlaceholderArray initWithObjects:count:]: attempt to insert nil object from objects[1]'
    
    
    // 测试字典
//    NSDictionary *dic = @{@"123":[NSNull new]};
    NSDictionary *dic = @{@"123":stra,@"s":@"b",stra:@"c",@"k4":[NSNull new],[NSNull new]:@"v5"};
    NSLog(@"______%@______",dic);
//    -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]: attempt to insert nil object from objects[0]'
//    -[NSNull objectAtIndexedSubscript:]: unrecognized selector sent to instance 0x1092e9f28
     

    
    
    
}


@end
