//
//  ViewController.m
//  chapter9_1
//
//  Created by zmx on 2017/9/19.
//  Copyright © 2017年 zmx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UITextField *durationField;
@property (nonatomic, strong) UITextField *repeatField;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) CALayer *shipLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    [self.view addSubview:self.containerView];
    
    self.durationField = [[UITextField alloc] initWithFrame:CGRectMake(0, 310, [UIScreen mainScreen].bounds.size.width, 40)];
    self.durationField.placeholder = @"duration";
    [self.view addSubview:self.durationField];
    
    self.repeatField = [[UITextField alloc] initWithFrame:CGRectMake(0, 360, [UIScreen mainScreen].bounds.size.width, 40)];
    self.repeatField.placeholder = @"repeat";
    [self.view addSubview:self.repeatField];
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startButton setTitle:@"start" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.startButton.frame = CGRectMake(0, 410, [UIScreen mainScreen].bounds.size.width, 40);
    [self.startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 150);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship.png"].CGImage;
    [self.containerView.layer addSublayer:self.shipLayer];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdit)];
    [self.view addGestureRecognizer:tap];
}

- (void)endEdit {
    [self.view endEditing:YES];
}


- (void)setControlsEnabled:(BOOL)enabled
{
    for (UIControl *control in @[self.durationField, self.repeatField, self.startButton]) {
        control.enabled = enabled;
        control.alpha = enabled? 1.0f: 0.25f;
    }
}

- (void)hideKeyboard {
    [self.durationField resignFirstResponder];
    [self.repeatField resignFirstResponder];
}

- (void)start
{
    CFTimeInterval duration = [self.durationField.text doubleValue];
    float repeatCount = [self.repeatField.text floatValue];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    //disable controls
    [self setControlsEnabled:NO];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //reenable controls
    [self setControlsEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
