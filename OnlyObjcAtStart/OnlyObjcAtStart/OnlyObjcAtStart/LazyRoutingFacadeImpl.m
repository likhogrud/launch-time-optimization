//
//  LazyRoutingFacadeImpl.m
//  LazySwift
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazyRoutingFacadeImpl.h"
#import "Routing.h"
#import <dlfcn.h>

@implementation LazyRoutingFacadeImpl

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{

        NSString *frameworksPath = [[NSBundle mainBundle] privateFrameworksPath];
        NSString *dyLib = @"Routing.framework/Routing";
        NSString *path = [NSString stringWithFormat:@"%@/%@", frameworksPath, dyLib];

        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+(Class)RoutingFacadeImplClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        [self loadLib];
        class = NSClassFromString(@"Routing.RoutingFacadeImpl");
        if (!class) {
            assert(false);
        }
    });
    return class;
}

- (void)performRouting {
    [[[LazyRoutingFacadeImpl RoutingFacadeImplClass] new] performRouting];
}

@end
