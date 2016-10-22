//
//  ViewController.m
//  SlideUpLayout
//
//  Created by 史一峰 on 16/10/21.
//  Copyright © 2016年 史一峰. All rights reserved.
//

#import "ViewController.h"
#import "BottomSlideLayout.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic, strong)BottomSlideLayout *slideLayout;
@property(nonatomic, assign)CGPoint slidePoint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slideLayout = [[BottomSlideLayout alloc]initWithFrame:CGRectMake(0, screenHeight/2, screenWidth, screenHeight)];
    
    self.slidePoint = CGPointMake(self.slideLayout.center.x, self.slideLayout.center.y);
    self.slideLayout.userInteractionEnabled = YES;
    [self.view addSubview:self.slideLayout];
    [self configGesture];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configGesture {
    // 屏幕边缘手势设定
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handleEdgePanRecognizer:)];
    edgePanGesture.edges = UIRectEdgeBottom;
    edgePanGesture.delegate = self;
    
    // View手势设定
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanRecognizer:)];
    panGesture.delegate = self;
    [self.slideLayout addGestureRecognizer:panGesture];
}

#pragma mark - Gestures
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        
        if ([otherGestureRecognizer.view isKindOfClass:[BottomSlideLayout class]]) {
            return YES;
        }
        
    }
    return NO;
}
- (void)handleEdgePanRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer {
    [self handlePanRecognizer:recognizer];
    
}
- (void)handlePanRecognizer:(UIPanGestureRecognizer *)recognizer {
    CGFloat value = -[recognizer translationInView:self.slideLayout].y;
    NSLog(@"value = %f", value);
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.slidePoint = CGPointMake(self.slideLayout.center.x, self.slideLayout.center.y);
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        if (self.slidePoint.y-value < screenHeight/2) {
            self.slideLayout.center = CGPointMake(self.slidePoint.x, screenHeight/2);
        } else if (self.slidePoint.y-value > screenHeight) {
            self.slideLayout.center = CGPointMake(self.slidePoint.x, screenHeight);
        } else {
            self.slideLayout.center = CGPointMake(self.slidePoint.x, self.slidePoint.y-value);
        }
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        // 获得y轴的速度
        CGFloat velocityY = [recognizer velocityInView:self.slideLayout].y;
        CGFloat slideFactor = ABS(velocityY/200 *.1);
        CGFloat finalY = self.slideLayout.center.y+velocityY*slideFactor;
        
        NSLog(@"velocityY = %f, finalY = %f", velocityY,finalY);
        
        [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            if (finalY < screenHeight*3/4) {
                self.slideLayout.center = CGPointMake(self.slidePoint.x, screenHeight/2);
            } else if (finalY > screenHeight*3/4) {
                self.slideLayout.center = CGPointMake(self.slidePoint.x, screenHeight);
            } else {
                self.slideLayout.center = CGPointMake(self.slidePoint.x, finalY);
            }
        } completion:nil];
        
        
    }
}

@end
