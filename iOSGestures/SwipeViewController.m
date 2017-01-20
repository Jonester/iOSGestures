//
//  SwipeViewController.m
//  iOSGestures
//
//  Created by Chris Jones on 2017-01-19.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic, assign) BOOL centered;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 380;
    CGFloat height = 50;
    
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height)];
    whiteView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:whiteView];
    
    whiteView.clipsToBounds = YES;
    
    UIView *redView = [[UIView alloc]initWithFrame:whiteView.bounds];
    redView.backgroundColor = [UIColor redColor];
    
    [whiteView addSubview:redView];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureSwiped:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [redView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureSwiped:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [redView addGestureRecognizer:swipeRight];
    self.centered = YES;
}

- (void)gestureSwiped: (UISwipeGestureRecognizer *)sender {
    
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft: {
            if (self.centered == YES) {
                sender.view.transform = CGAffineTransformMakeTranslation(-100, 0);
                self.centered = NO;
            } else {
                sender.view.transform = CGAffineTransformMakeTranslation(0, 0);
                self.centered = YES;
                }
            break;
        }
        case UISwipeGestureRecognizerDirectionRight: {
            if (self.centered == YES) {
                sender.view.transform = CGAffineTransformMakeTranslation(100, 0);
                self.centered = NO;
            } else {
                sender.view.transform = CGAffineTransformMakeTranslation(0, 0);
                self.centered = YES;
            }
            break;
        }
            default:
            break;
    }
}

@end
