//
//  ViewController.m
//  chapter6_7
//
//  Created by zmx on 16/6/7.
//  Copyright © 2016年 zmx. All rights reserved.
//  反射

#import "ViewController.h"
#import "ReflectionView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ReflectionView *view = [[ReflectionView alloc] initWithFrame:CGRectMake(80, 80, 80, 80)];
    [self.view addSubview:view];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:view.bounds];
    [view addSubview:image];
    image.image = [UIImage imageNamed:@"account_home_header_disable"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
