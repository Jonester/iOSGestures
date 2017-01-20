//
//  EdgePanViewController.m
//  Gestures
//
//  Created by Chris Jones on 2016-12-19.
//  Copyright © 2016 Jonescr. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController () <UIGestureRecognizerDelegate>

@property (nonatomic) UIView *sideRectangle;
@property (nonatomic) CGRect frameOrigin;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;

@end

@implementation EdgePanViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _height = 300;
        _width = 500;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.height = 300;
    self.width = 500;
    
    self.frameOrigin = CGRectMake(400, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height);
    self.sideRectangle = [[UIView alloc]initWithFrame:self.frameOrigin];
    self.sideRectangle.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.sideRectangle];
    
    UIScreenEdgePanGestureRecognizer *screenEdge = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGesture:)];
    
    screenEdge.edges = UIRectEdgeRight;
    screenEdge.delegate = self;
    
    [self.sideRectangle addGestureRecognizer:screenEdge];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)edgePanGesture: (UIScreenEdgePanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint locationInView = [sender translationInView:sender.view];
        CGPoint oldCenter = sender.view.center;
        CGPoint newCenter = CGPointMake(oldCenter.x + locationInView.x, oldCenter.y);
        
        [sender setTranslation:CGPointZero inView:self.view];
        sender.view.center = newCenter;
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.sideRectangle.frame.origin.x > 300) {
            self.sideRectangle.frame = self.frameOrigin;
        } else {
            CGRect newOrigin = CGRectMake(100, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height);
            self.sideRectangle.frame = newOrigin;
            
            UIPanGestureRecognizer *panBack = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panBackToEdge:)];
            [self.sideRectangle addGestureRecognizer:panBack];
        }
    }
}

- (void)panBackToEdge: (UIPanGestureRecognizer *)sender {
    
    CGPoint locationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + locationInView.x, oldCenter.y);
    
    
    if (self.sideRectangle.frame.origin.x > 200) {
        self.sideRectangle.frame = self.frameOrigin;
    } else {
        [sender setTranslation:CGPointZero inView:self.view];
        sender.view.center = newCenter;
    }
}

@end
