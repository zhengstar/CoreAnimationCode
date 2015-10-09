//
//  ViewController.m
//  animation
//
//  Created by zheng on 15/9/29.
//  Copyright © 2015年 rong360. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (nonatomic, strong) UIView *layerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(80, 200, 300, 300)];
    self.layerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.layerView];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //add it to our view
    [self.layerView.layer addSublayer:blueLayer];
    
    [blueLayer display];
//    UIImage *image = [UIImage imageNamed:@"account_home_header_disable"];
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    //self.layerView.layer.contentsScale = 1;
//    self.layerView.layer.masksToBounds = YES;
//    //self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
//    self.layerView.layer.contentsCenter = CGRectMake(0, 0, 0.5, 0.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
@end
