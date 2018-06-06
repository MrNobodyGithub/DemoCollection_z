//
//  ZNavDelegate.m
//  XSQNavigationTransitionDemo
//
//  Created by CityMedia on 2018/6/6.
//  Copyright © 2018年 徐霜晴. All rights reserved.
//

#import "ZNavDelegate.h"
#import "ZPushAnimation.h"
#import "ZPopAnimation.h"

#import "XSQDetailViewController.h"
#import "XSQMasterViewController.h"

@interface ZNavDelegate ()
@property (nonatomic, strong) ZPushAnimation *pushAnimation;
@property (nonatomic, strong) ZPopAnimation *popAnimation;

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition * percentTrans;
@end

@implementation ZNavDelegate

-(UIPercentDrivenInteractiveTransition *)percentTrans{
    if (!_percentTrans) {
        _percentTrans = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return  _percentTrans;
}


-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (animationController == self.popAnimation) {
        return self.percentTrans;
    }
    return  nil;
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        XSQMasterViewController * masterVC = (XSQMasterViewController *)fromVC;
        if (!self.pushAnimation) {
            self.pushAnimation = [[ZPushAnimation alloc] initWithThumbView:masterVC.thumbView];
        }
        return self.pushAnimation;
    }else if (operation == UINavigationControllerOperationPop){
        
        XSQDetailViewController *detailViewController = (XSQDetailViewController *)fromVC;
        [self.percentTrans updateInteractiveTransition:0];
        detailViewController.interactiveTransition = self.percentTrans;
        
        XSQMasterViewController *masterViewController = (XSQMasterViewController *)toVC;
        if (!_popAnimation) {
            _popAnimation = [[ZPopAnimation alloc] initWithThumbImage:masterViewController.thumbView];
        }
        return self.popAnimation;
    }
    return nil;
}
@end
