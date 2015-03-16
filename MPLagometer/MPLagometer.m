//
//  MPLagometer.m
//  MPLagometer
//
//  Created by Maxim Pervushin on 16/03/15.
//  Copyright (c) 2015 Maxim Pervushin. All rights reserved.
//

#import "MPLagometer.h"

static const NSTimeInterval kDefaultLagInterval = 0.25;
static const NSTimeInterval kDefaultSleepInterval = 0.05;

@interface MPLagometer ()

@property(nonatomic, strong) dispatch_semaphore_t semaphore;

- (void)restart;

@end

@implementation MPLagometer
@synthesize semaphore = semaphore_;
@synthesize enabled = enabled_;
@synthesize lagInterval = lagInterval_;

- (void)setEnabled:(BOOL)enabled {
    enabled_ = enabled;
    if (enabled_) {
        [self restart];
    }
}

- (BOOL)isEnabled {
    return enabled_;
}

- (void)restart {
    __weak typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        __strong typeof(self)strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }

        while (strongSelf.isEnabled) {
            NSDate *requestDate = [NSDate new];
            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_semaphore_signal(strongSelf.semaphore);
            });
            dispatch_semaphore_wait(strongSelf.semaphore, DISPATCH_TIME_FOREVER);
            NSDate *responseDate = [NSDate new];
            NSTimeInterval interval = [responseDate timeIntervalSinceDate:requestDate];
            if (interval > strongSelf.lagInterval) {
                NSLog(@"Lag %.2f", interval);
            }
            [NSThread sleepForTimeInterval:kDefaultSleepInterval];
        }
    });
}

- (instancetype)init {
    self = [super init];
    if (self) {
        semaphore_ = dispatch_semaphore_create(1);
        enabled_ = YES;
        lagInterval_ = kDefaultLagInterval;
        [self restart];
    }
    return self;
}

@end
