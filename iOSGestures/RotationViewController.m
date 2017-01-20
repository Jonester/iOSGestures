//
//  RotationViewController.m
//  iOSGestures
//
//  Created by Chris Jones on 2017-01-19.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.width = 100;
    self.height = 100;
    
    UIView *greenView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - self.width/2, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height)];
    
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(gestureRotated:)];
    
    [greenView addGestureRecognizer:rotationGesture];

}

- (void)gestureRotated: (UIRotationGestureRecognizer *)sender {
    
//    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
//    sender.rotation = 0;
    
    sender.view.transform = CGAffineTransformMakeRotation(sender.rotation);
}

@end
