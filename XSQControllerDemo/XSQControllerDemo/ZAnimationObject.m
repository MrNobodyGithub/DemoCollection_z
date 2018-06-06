//
//  ZAnimationObject.m
//  XSQControllerDemo
//
//  Created by CityMedia on 2018/6/6.
//  Copyright © 2018年 徐霜晴. All rights reserved.
//

#import "ZAnimationObject.h"
@interface ZAnimationObject ()

@property (nonatomic, strong) UIView *thumbView;

@end
@implementation ZAnimationObject
-(id)initWithThumbView:(UIView *)thumbView{
    if (self = [super init]) {
        _thumbView = thumbView;
    }
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return  1.0;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView  * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
//    CGRect thumbFramea = [[transitionContext containerView] convertRect:self.thumbView.frame fromView:self.thumbView];
//    CGRect thumbFrameb = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:fromView];
//    CGRect thumbFramec = [[transitionContext containerView] convertRect:self.thumbView.frame fromView:fromView];

    
    if (toVC.isBeingPresented) {
        // present  ing
        [toView setFrame:thumbFrame];
        [[transitionContext containerView] addSubview:toView];
        CGRect fineFrame = [transitionContext finalFrameForViewController:toVC];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [toView setFrame:fineFrame];
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else if(fromVC.isBeingDismissed){
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [fromView setFrame:thumbFrame];
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
 
    
    
}

@end
