//
//  ViewController.m
//  chapter5_1
//
//  Created by zmx on 16/2/15.
//  Copyright © 2016年 rong360. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView;
@end

@implementation ViewController

CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(80, 200, 300, 300)];
    self.layerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.layerView];
    
    UIImage *image = [UIImage imageNamed:@"account_home_header_disable"];
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    
//    CGAffineTransform transform = CGAffineTransformIdentity; //create a new transform
//    transform = CGAffineTransformScale(transform, 0.5, 0.5); //scale by 50%
//    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0); //rotate by 30 degrees
//    transform = CGAffineTransformTranslate(transform, 200, 0); //translate by 200 points
//    图片向右边发生了平移，但并没有指定距离那么远（200像素），另外它还有点向下发生了平移。原因在于当你按顺序做了变换，上一个变换的结果将会影响之后的变换，所以200像素的向右平移同样也被旋转了30度，缩小了50%，所以它实际上是斜向移动了100像素。
    
    CGAffineTransform transform = CGAffineTransformMakeShear(1, 0);
    //apply transform to layer
    self.layerView.layer.affineTransform = transform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
