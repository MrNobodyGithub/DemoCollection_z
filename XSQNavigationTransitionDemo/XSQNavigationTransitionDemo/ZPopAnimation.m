//
//  ZPopAnimation.m
//  XSQNavigationTransitionDemo
//
//  Created by CityMedia on 2018/6/6.
//  Copyright © 2018年 徐霜晴. All rights reserved.
//

#import "ZPopAnimation.h"

@interface ZPopAnimation ()
@property (nonatomic,strong) UIView * thumbView;
@end

@implementation ZPopAnimation
-(id)initWithThumbImage:(UIView *)view{
    if (self = [super init]) {
        _thumbView = view;
    }
    return  self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];

    
    CGRect thumbRect = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
    
    [UIView animateWithDuration:1 animations:^{
        [fromView setFrame:thumbRect];
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
