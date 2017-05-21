//
//  RootViewController.h
//  LazySwift
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchFacade.h"
#import "RoutingFacade.h"

@interface RootViewController : UIViewController

- (instancetype)initWithSearchFacade:(id<SearchFacade>)searchFacade routingFacade:(id<RoutingFacade>)routingFacade;

@end

