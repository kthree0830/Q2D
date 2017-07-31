//
//  ViewController.m
//  QDLearn
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.title isEqualToString:@"裁剪"]) {
        [self caijian];
    }
    if ([self.title isEqualToString:@"截屏"]) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"750x1334IBD.png"]];
        imageView.frame = self.view.bounds;
        [self.view addSubview:imageView];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.title isEqualToString:@"截屏"]) {
        [self jieping];
    }
}
- (void)jieping {
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ref];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(image);
    
    [data writeToFile:@"/Users/zhangbin/Desktop/CoderZbCoderZbCoderZb.jpg" atomically:YES];
}

- (void)caijian {
   
    CGFloat bordeW = 10;
    UIImage *image = [UIImage imageNamed:@"750x1334IBD.png"];
    CGSize size = CGSizeMake(image.size.width + 2*bordeW, image.size.width + 2*bordeW);
    
    UIGraphicsBeginImageContext(size);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [[UIColor yellowColor]setFill];
    [path fill];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(bordeW, bordeW, image.size.width, image.size.width)];
    [path1 addClip];
    [image drawAtPoint:CGPointMake(bordeW, bordeW)];
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CGRect frame = {50,200,300,300};
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
        [self.view addSubview:imageView];
        imageView.image = i;
    });
   
    UIGraphicsEndImageContext();
    
}

@end
