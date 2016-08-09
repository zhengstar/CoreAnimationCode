//
//  ViewController.m
//  chapter5_4
//
//  Created by zmx on 16/2/16.
//  Copyright © 2016年 rong360. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView1;
@property (nonatomic, strong) UIView *layerView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //apply perspective transform to container
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    
    UIImage *image = [UIImage imageNamed:@"account_home_header_disable"];
    self.layerView1 = [[UIView alloc] initWithFrame:CGRectMake(70, 80, 80, 80)];
    self.layerView1.backgroundColor = [UIColor lightGrayColor];
    self.layerView1.layer.contents = (__bridge id)(image.CGImage);
    [self.view addSubview:self.layerView1];
    
    self.layerView2 = [[UIView alloc] initWithFrame:CGRectMake(170, 80, 80, 80)];
    self.layerView2.backgroundColor = [UIColor lightGrayColor];
    self.layerView2.layer.contents = (__bridge id)(image.CGImage);
    [self.view addSubview:self.layerView2];
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = transform1;
    
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
