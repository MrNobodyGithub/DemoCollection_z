//
//  XSQAnimatorObject.m
//  XSQControllerDemo
//
//  Created by 徐霜晴 on 15/10/18.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQShrinkAnimatorObject.h"

@interface XSQShrinkAnimatorObject ()

#define MLScreenWidth         [UIScreen mainScreen].bounds.size.width
// 当前屏幕高度
#define MLScreenHeight        [UIScreen mainScreen].bounds.size.height

@property (nonatomic, weak) UIView *thumbView;

@end

@implementation XSQShrinkAnimatorObject

- (id)initWithThumbView:(UIView *)thumbView {
    if (self = [super init]) {
        _thumbView = thumbView;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
//    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
    CGRect thumbFrame =  CGRectMake(0, MLScreenHeight, MLScreenWidth, MLScreenHeight);
    
    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         [fromView setFrame:thumbFrame];
                     }
                     completion:^(BOOL finished) {
                         if (![transitionContext transitionWasCancelled]) {
                             [fromView removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }
                         else {
                             [toView removeFromSuperview];
                             [transitionContext completeTransition:NO];
                         }
                     }];
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
}

@end
