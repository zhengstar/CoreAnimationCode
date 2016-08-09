//
//  ViewController.m
//  chapter6_9
//
//  Created by zmx on 16/6/8.
//  Copyright © 2016年 zmx. All rights reserved.
//  显示超大图片 CATiledLayer为载入大图造成的性能问题提供了一个解决方案：将大图分解成小片然后将他们单独按需载入

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(80, 80, 200, 200)];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.scrollView];
    
    //add the tiled layer
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    tileLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.scrollView.layer addSublayer:tileLayer];
    
    //configure the scroll view
    self.scrollView.contentSize = tileLayer.frame.size;
    
    //draw layer
    [tileLayer setNeedsDisplay];
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
{
    //determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    CGFloat scale = [UIScreen mainScreen].scale;
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width * scale);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height * scale);
    
    //load tile image
    NSString *imageName = [NSString stringWithFormat: @"Snowman_%02i_%02i", x, y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
    
    //draw tile
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
