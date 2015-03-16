//
// Created by Maxim Pervushin on 16/03/15.
// Copyright (c) 2015 Maxim Pervushin. All rights reserved.
//

#import "MPLagometer+SharedLagometer.h"


@implementation MPLagometer (SharedLagometer)

+ (instancetype)sharedLagometer {
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [MPLagometer new];
    });
    return sharedInstance;
}

@end