//
//  ViewController.m
//  chapter6_2
//
//  Created by zmx on 16/3/31.
//  Copyright © 2016年 rong360. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
@interface ViewController ()
@property (nonatomic, strong) UIView *labelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.labelView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 640)];
    [self.view addSubview:self.labelView];
    
    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];
    
    //set text attributes
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;//图层内容以怎样的分辨率渲染
    
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    
    //set layer font
//    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
//    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
//    textLayer.font = fontRef;
//    textLayer.fontSize = font.pointSize;
//    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \n elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \n leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \n fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \n lobortis";
    
    //create attributed string
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];
    
    //convert UIFont to a CTFont
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    //set text attributes
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                              };
    
    [string setAttributes:attribs range:NSMakeRange(0, [text length])];
    
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(6, 5)];
    
    //release the CTFont we created earlier
    CFRelease(fontRef);
    
    //set layer text
    textLayer.string = string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
