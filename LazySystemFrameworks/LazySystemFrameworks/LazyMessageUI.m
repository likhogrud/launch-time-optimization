//
//  LazyMessageIO.m
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazyMessageUI.h"
#import <MessageUI/MessageUI.h>
#import <dlfcn.h>

@implementation LazyMessageUI

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{
        NSString *path = @"/System/Library/Frameworks/MessageUI.framework/MessageUI";
        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+ (Class)MFMailComposeViewControllerClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        class = (__bridge Class)dlsym([self loadLib], "OBJC_CLASS_$_MFMailComposeViewController");;
        if (!class) {
            assert(false);
        }
    });
    return class;
}

+ (void)presentMailComposeViewController {
    MFMailComposeViewController *controller = [[[self MFMailComposeViewControllerClass] alloc] init];
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:controller animated:true completion:nil];
}

@end
