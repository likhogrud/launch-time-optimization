//
//  AVFoundationWrappers.h
//  RemoveSwiftLibsApp
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *AVWAudioSessionCategoryRecord;

@interface AVWAudioSession: NSObject

+ (instancetype)sharedInstance;

- (BOOL)setCategory:(NSString *)category error:(NSError **)outError;

@end
