//
//  ViewController.m
//  test
//
//  Created by CityMedia on 2019/3/6.
//  Copyright © 2019年 free. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "Person.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableString * flagStr;
//@property (nonatomic,strong) NSString * flagStr;
@property (nonatomic,copy) Person * person;

@property(nonatomic, weak) void(^block)(void);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCopyStrong];
    
    
}
- (void)setupPerson{
    
    Person * stra = [[Person alloc] init];
    //    打印对象的内存地址
    NSLog(@"0内存地址1：%p",stra);
    //打印指针自己的内存地址
    NSLog(@"0内存地址2：%x",&stra);
    printf("0retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(stra)));
    
    
    
    self.person = stra;
    
    //打印对象的内存地址
    NSLog(@"a内存地址1：%p",_person);
    //打印指针自己的内存地址
    NSLog(@"a内存地址2：%x",&_person);
    printf("aretain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(_person)));
    
}


- (void)dealloc{
    NSLog(@"---%s---",__func__);
}
- (void)setupBtn{
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self.view addSubview:btn];
    btn.center = self.view.center;
    
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"jump" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    
}
- (void)setupCopyStrong{
    
        NSMutableString * stra = [[NSMutableString alloc]initWithString:@"a"];;
//    NSString * stra = @"a";
    //打印对象的内存地址
    NSLog(@"0内存地址1：%p",stra);
    //打印指针自己的内存地址
    NSLog(@"0内存地址2：%x",&stra);
    printf("0retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(stra)));
    
    
    
    self.flagStr = stra;
    
    //打印对象的内存地址
    NSLog(@"a内存地址1：%p",_flagStr);
    //打印指针自己的内存地址
    NSLog(@"a内存地址2：%x",&_flagStr);
    printf("aretain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(_flagStr)));
    
    
    /*
     总结
     面向对象为可变的对象时
     strong(retain,weak) 修饰 内存地址不变 指针地址改变 引用计数 +1
     copy                修饰 内存地址改变 指针地址改变
     assign              修饰 内存地址不变 指针地址改变 引用计数 不变
     面向对象为不可变的对象时
     strong retain copy  修饰 内存地址不变 指针地址改变
     */
    /**
     可变字符串  strong(retain) 修饰
     nsmutString strong
     2019-03-07 10:53:32.757683+0800 test[2966:65643] 0内存地址1：0x600002e3ee80
     2019-03-07 10:53:32.757847+0800 test[2966:65643] 0内存地址2：e7d8f9a0
     0retain count = 1
     2019-03-07 10:53:32.757971+0800 test[2966:65643] a内存地址1：0x600002e3ee80
     2019-03-07 10:53:32.758069+0800 test[2966:65643] a内存地址2：8817a30
     aretain count = 2
     
     可变字符串  copy 修饰
     nsmutString copy
     2019-03-07 10:54:56.795240+0800 test[2990:66828] 0内存地址1：0x600002008150
     2019-03-07 10:54:56.795377+0800 test[2990:66828] 0内存地址2：ee7509a0
     0retain count = 1
     2019-03-07 10:54:56.795491+0800 test[2990:66828] a内存地址1：0x917133492cad8843
     2019-03-07 10:54:56.795594+0800 test[2990:66828] a内存地址2：2ef09c50
     aretain count = 9223372036854775807
     */
    /**
     不可变字符串 strong (retain copy) 修饰
     你是string strong (retain copy)
     2019-03-07 11:00:57.668043+0800 test[3070:71224] 0内存地址1：0x10b5a01d8
     2019-03-07 11:00:57.668202+0800 test[3070:71224] 0内存地址2：e465f9a0
     0retain count = 1152921504606846975
     2019-03-07 11:00:57.668300+0800 test[3070:71224] a内存地址1：0x10b5a01d8
     2019-03-07 11:00:57.668416+0800 test[3070:71224] a内存地址2：2f40dd60
     aretain count = 1152921504606846975
     */
}
- (void)btnAction{
    
    //    TwoViewController * vc = [[TwoViewController alloc] init];
    //    [self presentViewController:vc animated:YES completion:^{
    //    }];
    
    
    //    OneViewController * vc = [[OneViewController alloc] init];
    //
    //    NSLog(@"btn   retain count = %ld",CFGetRetainCount((__bridge CFTypeRef)(vc)));
    //    __weak typeof(vc) weakvc = vc;
    //    vc.block = ^{
    //        vc.code = @"asdf";
    //
    //        NSLog(@"block  retain count = %ld",CFGetRetainCount((__bridge CFTypeRef)(vc)));
    //    };
    //    [self presentViewController:vc animated:YES completion:^{
    //    }];
}




@end
