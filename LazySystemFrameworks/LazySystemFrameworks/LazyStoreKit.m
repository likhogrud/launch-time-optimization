//
//  LazyStoreKit.m
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazyStoreKit.h"
#import <StoreKit/StoreKit.h>
#import <dlfcn.h>

@implementation LazyStoreKit

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{
        NSString *path = @"/System/Library/Frameworks/StoreKit.framework/StoreKit";
        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+ (Class)SKStoreProductViewControllerClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        class = (__bridge Class)dlsym([self loadLib], "OBJC_CLASS_$_SKStoreProductViewController");;
        if (!class) {
            assert(false);
        }
    });
    return class;
}

+ (void)presentStoreKitViewController {
    SKStoreProductViewController *storeController = [[[self SKStoreProductViewControllerClass] alloc] init];
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:storeController animated:true completion:nil];

}

@end
