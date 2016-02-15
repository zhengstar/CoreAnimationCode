//
//  ViewController.m
//  chapter4_5
//
//  Created by zmx on 16/2/2.
//  Copyright © 2016年 rong360. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 150, 150)];
    self.imageView.image = [UIImage imageNamed:@"bill-empty"];
    [self.view addSubview:self.imageView];
    
    //create mask layer
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    maskLayer.magnificationFilter = kCAFilterNearest;
    UIImage *maskImage = [UIImage imageNamed:@"yaw1.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    
    //apply mask to image layer￼
    self.imageView.layer.mask = maskLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
