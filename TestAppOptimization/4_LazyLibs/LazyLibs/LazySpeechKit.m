//
//  LazySpeechKit.m
//  LazyLibs
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "LazySpeechKit.h"
#import <dlfcn.h>
#import <YandexSpeechKit/SpeechKit.h>

@implementation LazySpeechKit

+ (void *)loadLib {
    static dispatch_once_t once;
    static void *dlopenResult;
    dispatch_once(&once, ^{

        NSString *frameworksPath = [[NSBundle mainBundle] privateFrameworksPath];
        NSString *dyLib = @"LazySpeechKit.framework/LazySpeechKit";
        NSString *path = [NSString stringWithFormat:@"%@/%@", frameworksPath, dyLib];

        dlopenResult = dlopen([path cStringUsingEncoding:NSASCIIStringEncoding], RTLD_LAZY);
        if (!dlopenResult) {
            assert(false);
        }
    });
    return dlopenResult;
}

+(Class)YSKRecognizerClass {
    static dispatch_once_t once;
    static Class class;
    dispatch_once(&once, ^{
        class = (__bridge Class)dlsym([self loadLib], "OBJC_CLASS_$_YSKRecognizer");
        if (!class) {
            assert(false);
        }
    });
    return class;
}

+ (NSString *)YSKRecognitionLanguageRussian {
    static dispatch_once_t once;
    static NSString *__autoreleasing *YSKRecognitionLanguageRussianPtr;
    dispatch_once(&once, ^{
        YSKRecognitionLanguageRussianPtr = (NSString *__autoreleasing *)dlsym([LazySpeechKit loadLib], "YSKRecognitionLanguageRussian");
        if (!YSKRecognitionLanguageRussianPtr) {
            assert(false);
        }
    });
    return *YSKRecognitionLanguageRussianPtr;

}

+ (NSString *)YSKRecognitionModelMaps {
    static dispatch_once_t once;
    static NSString *__autoreleasing *YSKRecognitionModelMapsPtr;
    dispatch_once(&once, ^{
        YSKRecognitionModelMapsPtr = (NSString *__autoreleasing *)dlsym([LazySpeechKit loadLib], "YSKRecognitionModelMaps");
        if (!YSKRecognitionModelMapsPtr) {
            assert(false);
        }
    });
    return *YSKRecognitionModelMapsPtr;
}


@end

@interface YSKLRecognizer() {
    YSKRecognizer *_impl;
}

@end

@implementation YSKLRecognizer

- (instancetype)initWithLanguage:(NSString *)language model:(NSString *)model {
    self = [super init];
    if (self) {
        _impl = [[[LazySpeechKit YSKRecognizerClass] alloc] initWithLanguage:language model:model];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _impl = [[[LazySpeechKit YSKRecognizerClass] alloc] init];
    }
    return self;
}

@end
