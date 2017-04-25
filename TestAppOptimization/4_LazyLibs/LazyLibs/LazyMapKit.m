//
//  LazyMapKit.m
//  LazyLibs
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazyMapKit.h"
#import <dlfcn.h>
#import <YandexMapKit/YandexMapKit.h>

@implementation LazyMapKit

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{

        NSString *frameworksPath = [[NSBundle mainBundle] privateFrameworksPath];
        NSString *dyLib = @"LazyMapKit.framework/LazyMapKit";
        NSString *path = [NSString stringWithFormat:@"%@/%@", frameworksPath, dyLib];

        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+(Class)YMKMapViewClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        class = (__bridge Class)dlsym([self loadLib], "OBJC_CLASS_$_YMKMapView");
        if (!class) {
            assert(false);
        }
    });
    return class;
}


@end

@interface YMKLMapView() {
    YMKMapView *_impl;
}

@end

@implementation YMKLMapView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _impl = [[[LazyMapKit YMKMapViewClass] alloc] init];
    }
    return self;
}

@end
