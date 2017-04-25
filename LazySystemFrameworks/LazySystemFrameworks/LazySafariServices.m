//
//  LazySafariServices.m
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazySafariServices.h"
#import <SafariServices/SafariServices.h>
#import <dlfcn.h>


@implementation LazySafariServices

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{
        NSString *path = @"/System/Library/Frameworks/SafariServices.framework/SafariServices";
        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+ (Class)SFSafariViewControllerClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        class = (__bridge Class)dlsym([self loadLib], "OBJC_CLASS_$_SFSafariViewController");;
        if (!class) {
            assert(false);
        }
    });
    return class;
}

+ (void)presentSafariViewController {
    SFSafariViewController *controller = [[[self SFSafariViewControllerClass] alloc] initWithURL:[[NSURL alloc] initWithString:@"https://yandex.ru"]];
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:controller animated:true completion:nil];
}

@end
