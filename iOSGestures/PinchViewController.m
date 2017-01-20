//
//  PinchViewController.m
//  iOSGestures
//
//  Created by Chris Jones on 2017-01-19.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    
    UIView *purpleView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - width/2, width, height)];
    
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(viewPinched:)];
    [purpleView addGestureRecognizer:pinchGesture];
}

-(void)viewPinched:(UIPinchGestureRecognizer*) sender {
    CGFloat scaleValue = sender.scale;
    sender.view.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
    scaleValue = 1.0;
}

@end
