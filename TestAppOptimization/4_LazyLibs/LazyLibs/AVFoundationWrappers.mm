//
//  AVFoundationWrappers.m
//  RemoveSwiftLibsApp
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "AVFoundationWrappers.h"
#import <AVFoundation/AVFoundation.h>

NSString *AVWAudioSessionCategoryRecord = AVAudioSessionCategoryRecord;

@interface AVWAudioSession() {
    AVAudioSession *_impl;
}

@end

@implementation AVWAudioSession

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static AVWAudioSession *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithImpl:[AVAudioSession sharedInstance]];
    });
    return instance;
}

- (instancetype)initWithImpl:(AVAudioSession *)impl
{
    self = [super init];
    if (self) {
        _impl = impl;
    }
    return self;
}

- (BOOL)setCategory:(NSString *)category error:(NSError **)outError {
    return [_impl setCategory:category error:outError];
}

@end
