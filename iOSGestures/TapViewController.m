//
//  TapViewController.m
//  iOSGestures
//
//  Created by Chris Jones on 2017-01-19.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    UIView *orangeView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height)];
    
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];

    UITapGestureRecognizer *tapGesture  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureTapped:)];
    [orangeView addGestureRecognizer:tapGesture];
}

-(void)gestureTapped: (UITapGestureRecognizer *)sender {
    UIColor *color = [sender.view.backgroundColor isEqual:[UIColor orangeColor]] ? [UIColor blueColor] : [UIColor orangeColor];
    sender.view.backgroundColor = color;
}

@end
