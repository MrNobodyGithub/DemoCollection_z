//
//  XSQMasterViewController.m
//  XSQNavigationTransitionDemo
//
//  Created by 徐霜晴 on 15/11/27.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQMasterViewController.h"
#import "XSQDetailViewController.h"
#import "XSQNavigationControllerDelegate.h"


@interface XSQView : UIView;

@end

@implementation XSQView

- (void)removeFromSuperview {
    [super removeFromSuperview];
    NSLog(@"XSQView has been removed");
}

@end

@interface XSQMasterViewController ()
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation XSQMasterViewController

- (void)loadView {
    self.view = [[XSQView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - 100, CGRectGetHeight(self.view.bounds) - 100, 100, 100)];
    [button addTarget:self action:@selector(handleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];
    
    self.thumbView = button;
    
    

    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
    
}

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    UISwipeGestureRecognizer;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    static CGFloat beginY;
    CGFloat currentY = [gestureRecognizer translationInView:window].y;
    CGFloat percent =  - (currentY - beginY) / CGRectGetHeight(window.bounds);
    
    NSLog(@"--- pan master %f---",percent  );
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            beginY = [gestureRecognizer translationInView:window].y;
            XSQDetailViewController * vc = [[XSQDetailViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
            
            [self.interactiveTransition updateInteractiveTransition:percent];
            NSLog(@"--- change bb ---");
            break;
        case UIGestureRecognizerStateEnded:
            if (percent > 0.5) {
                [self.interactiveTransition finishInteractiveTransition];
            }
            else {
                [self.interactiveTransition cancelInteractiveTransition];
            }
            break;
        default:
            break;
    }
}


- (void)handleButtonPressed:(UIButton *)sender {
    XSQDetailViewController *detailViewController = [[XSQDetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
