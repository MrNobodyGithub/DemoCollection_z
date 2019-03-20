//
//  NSObject+Z.h
//  testa
//
//  Created by CityMedia on 2019/3/19.
//  Copyright © 2019年 free. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Z)
+ (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
+ (void)exchangeInstanceMethodWithoriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
@end

NS_ASSUME_NONNULL_END
