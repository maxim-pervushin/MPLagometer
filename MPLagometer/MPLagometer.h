//
//  MPLagometer.h
//  MPLagometer
//
//  Created by Maxim Pervushin on 16/03/15.
//  Copyright (c) 2015 Maxim Pervushin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPLagometer : NSObject

@property (nonatomic, assign, getter=isEnabled) BOOL enabled;

@property (nonatomic, assign) NSTimeInterval lagInterval;

@end
