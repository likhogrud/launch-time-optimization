//
//  MapKitWrappers.h
//  RemoveSwiftLibsApp
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreLocationWrappers.h"

typedef NS_ENUM(unsigned int, MKWDirectionsTransportType) {
    MKWDirectionsTransportTypeAutomobile = 1 << 0,
    MKWDirectionsTransportTypeWalking = 1 << 1,
    MKWDirectionsTransportTypeTransit NS_ENUM_AVAILABLE(10_11, 9_0) = 1 << 2, // Only supported for ETA calculations
    MKWDirectionsTransportTypeAny = 0x0FFFFFFF
} NS_ENUM_AVAILABLE(10_9, 7_0) __TVOS_AVAILABLE(9_2) __WATCHOS_PROHIBITED;

@interface MKWPlacemark : NSObject

@property (nonatomic, readonly) CLWLocationCoordinate2D coordinate;

@end

@interface MKWMapItem : NSObject

@property (nonatomic, readonly) MKWPlacemark *placemark;
@property (nonatomic, readonly) BOOL isCurrentLocation;

@end

@interface MKWDirectionsRequest : NSObject

@property (nonatomic, strong, nullable) MKWMapItem *source;
@property (nonatomic, strong, nullable) MKWMapItem *destination;
@property(assign, nonatomic) MKWDirectionsTransportType transportType NS_AVAILABLE(10_9, 7_0); // Default is MKDirectionsTransportTypeAny

- (instancetype _Nonnull)initWithContentsOfURL:(NSURL *)url NS_AVAILABLE(10_9, 6_0);
+ (BOOL)isDirectionsRequestURL:(NSURL *)url NS_AVAILABLE(10_9, 6_0);

@end
