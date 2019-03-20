//
//  NSDictionary+Z.m
//  testa
//
//  Created by CityMedia on 2019/3/20.
//  Copyright © 2019年 free. All rights reserved.
//

#import "NSDictionary+Z.h"
#import "NSObject+Z.h"
#import <objc/runtime.h>

@implementation NSDictionary (Z)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSPlaceholderDictionary") exchangeInstanceMethodWithoriginalSelector:@selector(initWithObjects:forKeys:count:) swizzledSelector:@selector(st_initWithObjects:forKeys:count:)];
//        [__NSPlaceholderDictionary initWithObjects:forKeys:count:]
    });
}
-(instancetype)st_initWithObjects:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
//    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        // 这里只做value 为nil的处理 对key为nil不做处理
        if (objects[i] == nil) {
            objects[i] = [NSNull null]  ; //有看到很多人这个地方判断了objects 和keys 如果它们中有一个为nil 那么就直接break ，但是我个人不太建议使用key的值nil的时候直接break。
            // objects[i] = @"" ; 也可以根据个人情况这样写
        }
        if (keys[i] == nil) {
            keys[i] = @"key";
        }
//        rightCount++;
    }
    return  [self st_initWithObjects:objects forKeys:keys count:count];
}

@end
