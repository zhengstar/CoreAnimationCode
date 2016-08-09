//
//  CCScrollView.m
//  chapter6_8
//
//  Created by zmx on 16/6/7.
//  Copyright © 2016年 zmx. All rights reserved.
//

#import "CCScrollView.h"
#import <QuartzCore/QuartzCore.h>
@implementation CCScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

- (void)setUp
{
    //enable clipping
    self.layer.masksToBounds = YES;
    
    //attach pan gesture recognizer
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (id)initWithFrame:(CGRect)frame
{
    //this is called when view is created in code
    if ((self = [super initWithFrame:frame])) {
        [self setUp];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    //get the offset by subtracting the pan gesture
    //translation from the current bounds origin
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    //scroll the layer
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    
    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self];
}

@end
