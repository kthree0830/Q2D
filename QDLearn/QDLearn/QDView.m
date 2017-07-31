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
    }
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
