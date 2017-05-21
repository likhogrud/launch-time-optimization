//
//  AppDelegate.m
//  LazySwift
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "LazySearchFacadeImpl.h"
#import "LazyRoutingFacadeImpl.h"

@interface AppDelegate ()

@property(nonatomic, strong) id<SearchFacade> searchFacade;
@property(nonatomic, strong) id<RoutingFacade> routingFacade;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.searchFacade = [[LazySearchFacadeImpl alloc] init];
    self.routingFacade = [[LazyRoutingFacadeImpl alloc] init];

    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = [[RootViewController alloc] initWithSearchFacade:self.searchFacade
                                                                        routingFacade:self.routingFacade];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
