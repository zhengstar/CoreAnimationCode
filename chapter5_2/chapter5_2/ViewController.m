//
//  ViewController.m
//  chapter5_2
//
//  Created by zmx on 16/2/15.
//  Copyright © 2016年 rong360. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(80, 200, 150, 150)];
    self.layerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.layerView];
    UIImage *image = [UIImage imageNamed:@"account_home_header_disable"];
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    
    self.layerView.layer.transform = transform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
