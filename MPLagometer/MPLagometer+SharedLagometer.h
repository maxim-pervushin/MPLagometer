//
// Created by Maxim Pervushin on 16/03/15.
// Copyright (c) 2015 Maxim Pervushin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPLagometer.h"

@interface MPLagometer (SharedLagometer)

+ (instancetype)sharedLagometer;

@end