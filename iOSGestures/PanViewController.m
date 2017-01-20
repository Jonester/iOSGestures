//
//  PanViewController.m
//  iOSGestures
//
//  Created by Chris Jones on 2017-01-19.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender {
//    CGPoint locationInView = [sender locationInView:self.view];
//    sender.view.center = locationInView;

    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    [sender setTranslation:CGPointZero inView:self.view];
    sender.view.center = newCenter;
    
}

@end
