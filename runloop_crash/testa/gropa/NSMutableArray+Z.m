//
//  NSMutableArray+Z.m
//  testa
//
//  Created by CityMedia on 2019/3/20.
//  Copyright © 2019年 free. All rights reserved.
//


#import "NSMutableArray+Z.h"
#import <objc/runtime.h>
#import "NSObject+Z.h"
@implementation NSMutableArray (Z)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSArrayM") exchangeInstanceMethodWithoriginalSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(m_objectAtIndexedSubscript:)];
        [objc_getClass("__NSArrayM") exchangeInstanceMethodWithoriginalSelector:@selector(objectAtIndex:) swizzledSelector:@selector(m_objectAtIndex:)];
//        
//        [objc_getClass("__NSPlaceholderArray") exchangeInstanceMethodWithoriginalSelector:@selector(initWithObjects:count:) swizzledSelector:@selector(safeInitWithObjects:count:)];
    });
}
 
//- (instancetype)safeInitWithObjects:(const id  _Nonnull     __unsafe_unretained *)objects count:(NSUInteger)cnt
//{
//    BOOL hasNilObject = NO;
//    for (NSUInteger i = 0; i < cnt; i++) {
//        if ([objects[i] isKindOfClass:[NSArray class]]) {
//            NSLog(@"%@", objects[i]);
//        }
//        if (objects[i] == nil) {
//            hasNilObject = YES;
//            NSLog(@"%s object at index %lu is nil, it will be     filtered", __FUNCTION__, i);
//        }
//    }
//    // 因为有值为nil的元素，那么我们可以过滤掉值为nil的元素
//    if (hasNilObject) {
//        id __unsafe_unretained newObjects[cnt];
//        NSUInteger index = 0;
//        for (NSUInteger i = 0; i < cnt; ++i) {
//            if (objects[i] != nil) {
//                newObjects[index++] = objects[i];
//            }
//        }
//        return [self safeInitWithObjects:newObjects count:index];
//    }
//    return [self safeInitWithObjects:objects count:cnt];
//}


- (instancetype)m_objectAtIndexedSubscript:(NSUInteger)index{
    if (index >= self.count) {
        return @"m.";
    }
    return [self m_objectAtIndexedSubscript:index];
}
- (instancetype)m_objectAtIndex:(NSUInteger)index{
    if (index >= self.count) {
        return @"m..";
    }
    return [self m_objectAtIndex:index];
}

@end
