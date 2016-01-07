//
//  ViewController.m
//  chapter4
//
//  Created by zheng on 15/11/3.
//  Copyright © 2015年 rong360. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (nonatomic, strong) UIView *layerView1;
@property (nonatomic, strong) CALayer *redLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.layerView1 = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 80, 80)];
    self.layerView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.layerView1];
    
    self.layerView1.layer.cornerRadius = 20;
    self.layerView1.layer.masksToBounds = YES;
    self.layerView1.layer.shadowOpacity = 0.9f;
    self.layerView1.layer.shadowOffset = CGSizeMake(0, 3);
    
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectMake(-20, -20, 40, 40);
    self.redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layerView1.layer addSublayer:self.redLayer];
    self.redLayer.shadowOpacity = 0.8;
    self.redLayer.shadowRadius = 5;
    self.redLayer.shadowOffset = CGSizeMake(3, 3);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
