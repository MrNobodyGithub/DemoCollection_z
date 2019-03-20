//
//  NSObject+Z.m
//  testa
//
//  Created by CityMedia on 2019/3/19.
//  Copyright © 2019年 free. All rights reserved.
//


#import "NSObject+Z.h"
#import <objc/runtime.h>
@implementation NSObject (Z)

+ (void)exchangeInstanceMethodWithoriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector{
    
    Method methodOri = class_getInstanceMethod([self class], originalSelector);
    Method methodSwi = class_getInstanceMethod([self class], swizzledSelector);
    
    /**
     1.如果返回成功:则说明被替换方法没有存在.也就是被替换的方法没有被实现,我们需要先把这个方法实现,然后再执行我们想要的效果,用我们自定义的方法去替换被替换的方法. 这里使用到的是class_replaceMethod这个方法. class_replaceMethod本身会尝试调用class_addMethod和method_setImplementation，所以直接调用class_replaceMethod就可以了)
     */
    BOOL haveAddMethod = class_addMethod([self class], originalSelector, method_getImplementation(methodSwi), method_getTypeEncoding(methodSwi));
    if (haveAddMethod) {

        class_replaceMethod([self class], swizzledSelector, method_getImplementation(methodOri), method_getTypeEncoding(methodOri));
    }else{
        method_exchangeImplementations(methodOri, methodSwi);
    }
    
}
+ (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
} 
@end
