//
//  ViewController.m
//  MPLagometer
//
//  Created by Maxim Pervushin on 16/03/15.
//  Copyright (c) 2015 Maxim Pervushin. All rights reserved.
//

#import "ViewController.h"
#import "MPLagometer.h"
#import "MPLagometer+SharedLagometer.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UISwitch *lagometerEnabledSwitch;

- (IBAction)lagometerEnabledSwitchValueChanged:(id)sender;

- (IBAction)lag1Second:(id)sender;

- (IBAction)lag2Second:(id)sender;

- (IBAction)lag4Second:(id)sender;

- (IBAction)lag8Second:(id)sender;

@end

@implementation ViewController

- (IBAction)lagometerEnabledSwitchValueChanged:(id)sender {
    [MPLagometer sharedLagometer].enabled = self.lagometerEnabledSwitch.isOn;
}

- (IBAction)lag1Second:(id)sender {
    [NSThread sleepForTimeInterval:0.5];
//    [NSThread sleepForTimeInterval:1.0];
}

- (IBAction)lag2Second:(id)sender {
    [NSThread sleepForTimeInterval:2.0];
}

- (IBAction)lag4Second:(id)sender {
    [NSThread sleepForTimeInterval:4.0];
}

- (IBAction)lag8Second:(id)sender {
    [NSThread sleepForTimeInterval:8.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lagometerEnabledSwitch.on = [MPLagometer sharedLagometer].isEnabled;
}

@end
