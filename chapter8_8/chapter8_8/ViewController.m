//
//  ViewController.m
//  chapter8_8
//
//  Created by zmx on 2017/8/8.
//  Copyright © 2017年 zmx. All rights reserved.
//
/*
 虚拟属性并不是真实存在的，而是CAPropertyAnimation的valueFunction通过把虚拟属性的值转化成真正的用于摆放图层的CATransform3D矩阵值。
 虚拟属性常用于不能简单相加的属性
 */
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *containerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:self.containerView];
    
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship.png"].CGImage;
    [self.containerView.layer addSublayer:shipLayer];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer addAnimation:animation forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
