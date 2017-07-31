//
//  QDView.m
//  QDLearn
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "QDView.h"

@implementation QDView

- (void)drawRect:(CGRect)rect {
    if (self.type == 0 ) {
        [self rect];
    } else if (self.type == 1) {
        [self shanxingWithRect:rect];
    }
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
    CGContextRelease(ref);
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
    CGContextRelease(ref);
}

//随机生成一个颜色
- (UIColor *)randomColor {
    
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return  [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end
