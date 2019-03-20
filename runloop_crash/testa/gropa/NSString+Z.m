//
//  NSString+Z.m
//  testa
//
//  Created by CityMedia on 2019/3/20.
//  Copyright © 2019年 free. All rights reserved.
//

#import "NSString+Z.h"
#import "NSObject+Z.h"
#import <objc/runtime.h>
@implementation NSString (Z)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSCFConstantString") exchangeInstanceMethodWithoriginalSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(z_objectAtIndexedSubscript:)];
    });
}
-(instancetype)z_objectAtIndexedSubscript:(NSUInteger)index{
    return @"str.";
}
@end
