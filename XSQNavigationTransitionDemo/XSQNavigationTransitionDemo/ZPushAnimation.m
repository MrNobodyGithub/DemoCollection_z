//
//  ZPushAnimation.m
//  XSQNavigationTransitionDemo
//
//  Created by CityMedia on 2018/6/6.
//  Copyright © 2018年 徐霜晴. All rights reserved.
//

#import "ZPushAnimation.h"
@interface ZPushAnimation ()
@property (nonatomic, weak) UIView *thumbView;
@end
@implementation ZPushAnimation
- (id)initWithThumbView:(UIView *)thumbView {
    if (self = [super init]) {
        _thumbView = thumbView;
    }
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return  1.0;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    
    [[transitionContext containerView] addSubview:toView];
    
    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.frame fromView:fromView];
    toView.frame = thumbFrame;
    [UIView animateWithDuration:1 animations:^{
        toView.frame = [transitionContext finalFrameForViewController:toVC];
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [toView removeFromSuperview];
            [transitionContext completeTransition:NO];
        }else{
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }
    }];
    
    
}


@end
