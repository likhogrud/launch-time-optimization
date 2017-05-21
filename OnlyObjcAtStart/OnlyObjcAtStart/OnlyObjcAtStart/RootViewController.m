//
//  RootViewController.m
//  LazySwift
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property(nonatomic, weak) id<SearchFacade> searchFacade;
@property(nonatomic, weak) id<RoutingFacade> routingFacade;

@property(nonatomic, strong) UIButton *searchButton;
@property(nonatomic, strong) UIButton *routeButton;

@end

@implementation RootViewController

- (instancetype)initWithSearchFacade:(id<SearchFacade>)searchFacade routingFacade:(id<RoutingFacade>)routingFacade {
    self = [super initWithNibName:nil bundle:nil];

    self.searchFacade = searchFacade;
    self.routingFacade = routingFacade;

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.searchButton];
    self.searchButton.frame = CGRectMake(100, 100, 100, 100);
    [self.searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(onSearchButtonTapped) forControlEvents:UIControlEventTouchUpInside];


    self.routeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.routeButton];
    self.routeButton.frame = CGRectMake(100, 300, 100, 100);
    [self.routeButton setTitle:@"Route" forState:UIControlStateNormal];
    [self.routeButton addTarget:self action:@selector(onRoutingButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onSearchButtonTapped {
    [self.searchFacade performSearch];
}

- (void)onRoutingButtonTapped {
    [self.routingFacade performRouting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
