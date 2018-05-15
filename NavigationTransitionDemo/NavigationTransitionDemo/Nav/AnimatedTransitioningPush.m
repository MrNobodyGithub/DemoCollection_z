//
//  AnimatedTransitioningPush.m
//  NavigationTransitionDemo
//
//  Created by CityMedia on 2018/5/15.
//  Copyright © 2018年 free. All rights reserved.
//

#import "AnimatedTransitioningPush.h"
#define MLScreenWidth         [UIScreen mainScreen].bounds.size.width
// 当前屏幕高度
#define MLScreenHeight        [UIScreen mainScreen].bounds.size.height

@implementation AnimatedTransitioningPush


#pragma mark- UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
    CGRect toViewRect = CGRectMake(0,MLScreenHeight , MLScreenWidth, MLScreenHeight);
    [toView setFrame:toViewRect];
    [[transitionContext containerView] addSubview:toView];
    
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [toView setFrame:toViewFinalFrame];
    } completion:^(BOOL finished) {
        if (![transitionContext transitionWasCancelled]) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }else{
            [toView removeFromSuperview];
            [transitionContext completeTransition:NO];
        }
    }];
    
}

- (void)abcd{
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//
//    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
//    [toView setFrame:thumbFrame];
//
//    [[transitionContext containerView] addSubview:toView];
//
//    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext]
//                     animations:^{
//                         [toView setFrame:toViewFinalFrame];
//                     }
//                     completion:^(BOOL finished) {
//                         if (![transitionContext transitionWasCancelled]) {
//                             [fromView removeFromSuperview];
//                             [transitionContext completeTransition:YES];
//                         }
//                         else {
//                             [toView removeFromSuperview];
//                             [transitionContext completeTransition:NO];
//                         }
//                     }];
}

@end
