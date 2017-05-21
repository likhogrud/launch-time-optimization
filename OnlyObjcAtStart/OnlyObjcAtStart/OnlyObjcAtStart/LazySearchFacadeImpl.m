//
//  LazySearchFacadeImpl.m
//  LazySwift
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazySearchFacadeImpl.h"
#import "Search.h"
#import <dlfcn.h>

@implementation LazySearchFacadeImpl

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{

        NSString *frameworksPath = [[NSBundle mainBundle] privateFrameworksPath];
        NSString *dyLib = @"Search.framework/Search";
        NSString *path = [NSString stringWithFormat:@"%@/%@", frameworksPath, dyLib];

        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+(Class)SearchFacadeImplClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        class = (__bridge Class)dlsym([self loadLib], "OBJC_CLASS_$__TtC6Search16SearchFacadeImpl");
        if (!class) {
            assert(false);
        }
    });
    return class;
}

- (void)performSearch {
    [[[LazySearchFacadeImpl SearchFacadeImplClass] new] performSearch];
}

@end
