//
//  JJYelloPepleView.m
//  08YelloPeple
//
//  Created by JJ on 15-8-15.
//  Copyright (c) 2015年 apex. All rights reserved.
//

#import "JJYelloPepleView.h"

#define topMargin 50
#define radius 80//圆半径
#define bodyH 150

@implementation JJYelloPepleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //1
    [self drawBody:rect context:ctx];

    //2 眼镜
    [self drawGlasses:rect context:ctx];
    
    //3 嘴巴
    [self drawMouth:rect context:ctx];
    
    //4 头发
    [self drawHair:rect context:ctx];
}

# pragma - mark drayBody
- (void)drawBody:(CGRect)rect context:(CGContextRef)ctx
{
    
    CGFloat headX = rect.size.width * 0.5;
    CGFloat headY = topMargin + radius;
    [[UIColor yellowColor] set];
    CGContextAddArc(ctx, headX, headY, radius, 0, M_PI, 1);
    CGContextFillPath(ctx);
    
    CGFloat bodyX = rect.size.width * 0.5 - radius;
    CGFloat bodyY = headY;
    CGFloat bodyW = radius * 2;
    CGContextAddRect(ctx, CGRectMake(bodyX, bodyY, bodyW, bodyH));
    CGContextFillPath(ctx);

    CGFloat footX = headX;
    CGFloat footY = headY + bodyH;
    CGContextAddArc(ctx, footX, footY, radius, 0, M_PI, 0);
    CGContextFillPath(ctx);
}

# pragma - mark drayGlasses
- (void)drawGlasses:(CGRect)rect context:(CGContextRef)ctx
{
    //镜框－横
    CGFloat padding = 5;
    CGFloat glassX = rect.size.width * 0.5 - radius - padding;
    CGFloat glassY = topMargin + radius;
    CGFloat glassW = (radius + padding) * 2;
    CGFloat glassH = 30;
    [[UIColor blackColor] set];
    CGContextAddRect(ctx, CGRectMake(glassX, glassY, glassW, glassH));
    CGContextFillPath(ctx);
    
    //镜框－圆
    //左
    CGFloat eyeRadius = 32;
    CGFloat eyeX = rect.size.width * 0.5 - eyeRadius;
    CGFloat eyeY = topMargin + radius + glassH * 0.5;
    [[UIColor whiteColor] set];
    CGContextAddArc(ctx, eyeX, eyeY, eyeRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    //右
    [[UIColor whiteColor] set];
    CGContextAddArc(ctx, eyeX + 2*eyeRadius, eyeY, eyeRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    //眼睛－左
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 12);
    CGContextAddArc(ctx, eyeX, eyeY, eyeRadius, 0, M_PI * 2, 0);
    CGContextStrokePath(ctx);
    //右
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 12);
    CGContextAddArc(ctx, eyeX + 2*eyeRadius, eyeY, eyeRadius, 0, M_PI * 2, 0);
    CGContextStrokePath(ctx);
    
    CGFloat eyeCRadius = 10;
    CGFloat eyeCX = rect.size.width * 0.5 - eyeCRadius -12;
    CGFloat eyeCY = topMargin + radius + glassH * 0.5;
    [[UIColor blackColor] set];
    CGContextAddArc(ctx, eyeCX, eyeCY, eyeCRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    [[UIColor blackColor] set];
    CGContextAddArc(ctx, eyeCX + eyeCRadius * 2 + 24, eyeCY, eyeCRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
}

# pragma - mark drawMouth
- (void)drawMouth:(CGRect)rect context:(CGContextRef)ctx
{
    CGFloat mouthX = rect.size.width * 0.5;
    CGFloat mouthY = topMargin + radius + bodyH * 0.5 - 20;
    CGFloat mouthRadius = 50;
    CGContextSetLineWidth(ctx, 5);
    [[UIColor blackColor] set];
    CGContextAddArc(ctx, mouthX, mouthY, mouthRadius, M_PI * 0.2, M_PI * 0.8, 0);
    CGContextStrokePath(ctx);
}

# pragma - mark drawHair
- (void)drawHair:(CGRect)rect context:(CGContextRef)ctx
{
    CGFloat center = rect.size.width * 0.5;
    
    CGFloat hairH = 30;
    CGFloat hairX = center;
    CGFloat hairY = topMargin - 25;
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 2);
    CGContextMoveToPoint(ctx, hairX, hairY);
    CGContextAddLineToPoint(ctx, hairX, hairY + hairH);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, hairX - 20, hairY);
    CGContextAddLineToPoint(ctx, hairX - 10, hairY + hairH);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, hairX + 20, hairY);
    CGContextAddLineToPoint(ctx, hairX + 10, hairY + hairH);
    CGContextStrokePath(ctx);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self];
    
    NSLog(@"location : X: %2f, Y: %2f", location.x, location.y);
    
    //头发ddwei
}


@end




