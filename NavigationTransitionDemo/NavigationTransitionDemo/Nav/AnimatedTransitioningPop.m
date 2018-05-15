//
//  AnimatedTransitioningPop.m
//  NavigationTransitionDemo
//
//  Created by CityMedia on 2018/5/15.
//  Copyright © 2018年 free. All rights reserved.
//

#import "AnimatedTransitioningPop.h"

#define MLScreenWidth         [UIScreen mainScreen].bounds.size.width
// 当前屏幕高度
#define MLScreenHeight        [UIScreen mainScreen].bounds.size.height

@implementation AnimatedTransitioningPop

#pragma mark -UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
    CGRect * rect = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
//    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//
//    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
//
//    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
//
//    [UIView animateWithDuration:[self transitionDuration:transitionContext]
//                     animations:^{
//                         [fromView setFrame:thumbFrame];
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
