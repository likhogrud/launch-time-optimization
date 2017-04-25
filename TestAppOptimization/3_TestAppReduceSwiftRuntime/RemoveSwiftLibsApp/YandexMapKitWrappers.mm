//
//  YandexMapKitWrappers.m
//  RemoveSwiftLibsApp
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "YandexMapKitWrappers.h"
#import <YandexMapKit/YandexMapKit.h>

@interface YMKWMapView() {
    YMKMapView *_impl;
}

@end

@implementation YMKWMapView: UIView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _impl = [[YMKMapView alloc] init];
    }
    return self;
}

@end
