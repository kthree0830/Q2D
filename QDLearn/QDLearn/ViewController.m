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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)caijian {
    CGRect frame = {50,200,220,220};
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    [self.view addSubview:imageView];
    
    
    CGFloat bordeW = 10;
    UIImage *image = [UIImage imageNamed:@"tupian"];
    CGSize size = CGSizeMake(image.size.width + 2*bordeW, image.size.width + 2*bordeW);
    UIGraphicsBeginImageContext(size);
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [[UIColor yellowColor]setFill];
    [path fill];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(bordeW, bordeW, image.size.width, image.size.width)];
    [path1 addClip];;
    [image drawAtPoint:CGPointMake(bordeW, bordeW)];
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    
    imageView.image = i;
    UIGraphicsEndImageContext();
}

@end
