//
//  QDView.m
//  QDLearn
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 mac. All rights reserved.
//
#define testR CGRectMake(50, 150, 200, 200)
#import "QDView.h"

@implementation QDView
- (void)dealloc {

}
- (void)drawRect:(CGRect)rect {
    if (self.type == 0 ) {
        [self rect];
    } else if (self.type == 1) {
        [self shanxingWithRect:rect];
    } else if (self.type == 2) {
        [self yuanxingWithRect:rect];
    } else if (self.type == 3) {
        [self line];
    } else if (self.type == 4) {
        [self buguize];
    } else if (self.type == 5) {
        [self quxian];
    } else if (self.type == 6) {
        [self huabingWithRect:rect];
    } else if (self.type == 7) {
        [self huawenzi];
    }

    

}
- (void)huawenzi {
    NSString *str = @"Q2D学习";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    dic[NSForegroundColorAttributeName] = [UIColor redColor];
    dic[NSStrokeColorAttributeName] = [UIColor blueColor];
    dic[NSStrokeWidthAttributeName] = @5;
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowOffset = CGSizeMake(-10, -10);
    shadow.shadowBlurRadius = 10;
    dic[NSShadowAttributeName] = shadow;
    
    [str drawInRect:CGRectMake(0, 100, self.bounds.size.width, 200) withAttributes:dic];
}
- (void)huabingWithRect:(CGRect)rect {
    NSArray *dataArray = @[@25,@50];
    CGPoint center = CGPointMake(rect.size.width *0.5, rect.size.height *0.5);
    CGFloat radius = rect.size.width *0.5 - 10;
    CGFloat starA = 0;
    CGFloat endA = 0;
    CGFloat angle = 0;
    
    for (NSNumber *num in dataArray) {
        starA = endA;
        angle = num.intValue / 100.0 * M_PI * 2;
        endA = starA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:starA endAngle:endA clockwise:YES];
        [[self randomColor] set];
        [path addLineToPoint:center];
        [path fill];
    };
}
/**
 曲线
 */
- (void)quxian {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(90, 150)];
    [path addQuadCurveToPoint:CGPointMake(200, 150) controlPoint:CGPointMake(150, 10)];
    //    [path addCurveToPoint:CGPointMake(90, 150) controlPoint1:CGPointMake(200, 150) controlPoint2:CGPointMake(150, 10)];
    CGContextAddPath(ref, path.CGPath);
    CGContextStrokePath(ref);
}
/**
 不规则带点击
 */
- (void)buguize {
    _fillColor = [self randomColor];
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath moveToPoint:CGPointMake(320, 70)];
    [_bezierPath addLineToPoint:CGPointMake(30, 130)];
    [_bezierPath addLineToPoint:CGPointMake(80, 400)];
    [_bezierPath addLineToPoint:CGPointMake(370, 570)];
    [_bezierPath closePath];
    
    [_fillColor setFill];
    [_bezierPath fill];
    
    [[UIColor redColor] setStroke];
    _bezierPath.lineWidth = 4;
    [_bezierPath stroke];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if ([_bezierPath containsPoint:point]) {
        [self setNeedsDisplay];
    }
}
/**
 直线
 */
- (void)line {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 150)];
    [path addLineToPoint:CGPointMake(250, 90)];
    
    [path moveToPoint:CGPointMake(50, 205)];
    [path addLineToPoint:CGPointMake(250, 120)];
    
    CGContextSetLineWidth(ref, 20);
    CGContextSetLineCap(ref, kCGLineCapButt);
    CGContextSetLineJoin(ref, kCGLineJoinMiter);
    [[UIColor redColor] set];
    
    CGContextAddPath(ref, path.CGPath);
    CGContextStrokePath(ref);

}
/**
 圆形
 */
- (void)yuanxingWithRect:(CGRect)rect {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:testR cornerRadius:50];
    [[UIColor redColor] set];
    
    CGContextAddPath(ref, path.CGPath);
    CGContextStrokePath(ref);
}
/**
 扇形
 */
- (void)shanxingWithRect:(CGRect)rect {
    //中心
    CGPoint center = CGPointMake(rect.size.width *0.5, rect.size.height *0.5);
    CGFloat radius = rect.size.width *0.5 - 10;
    CGFloat starA = 0;
    CGFloat endA = M_PI_2;

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:starA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    path.lineWidth = 5;
    [[UIColor redColor] set];
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddPath(ref, path.CGPath);
    CGContextStrokePath(ref);
}
/**
 矩形
 */
- (void)rect {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 150, 200, 200)];
    CGContextAddPath(ref, path.CGPath);
    [[UIColor redColor]set];
    //    CGContextFillPath(ref);
    //    CGContextFillRect(ref, CGRectMake(50, 150, 200, 200));
    CGContextStrokePath(ref);
}

//随机生成一个颜色
- (UIColor *)randomColor {
    
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return  [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end
