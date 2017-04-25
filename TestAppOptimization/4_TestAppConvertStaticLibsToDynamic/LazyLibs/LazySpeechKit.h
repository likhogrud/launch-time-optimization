//
//  LazySpeechKit.h
//  LazyLibs
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LazySpeechKit : NSObject

+ (NSString *)YSKRecognitionLanguageRussian;
+ (NSString *)YSKRecognitionModelMaps;

@end

@interface YSKLRecognizer : NSObject

- (instancetype)initWithLanguage:(NSString *)language model:(NSString *)model;

@end
