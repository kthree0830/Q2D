//
//  ViewController.m
//  QDLearn
//
//  Created by mac on 2017/7/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "QDView.h"
@interface ViewController ()
@property (nonatomic, strong) QDView *customView;
@end

@implementation ViewController
- (void)dealloc {

}
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
    if ([self.title isEqualToString:@"水印"]) {
        [self shuiyin];
    }
    if ([self.title isEqualToString:@"矩形"]) {
        QDView *customView = [[QDView alloc]initWithFrame:self.view.bounds];
        customView.backgroundColor = [UIColor grayColor];
        customView.type = QDDrawTypeRect;
        [self.view addSubview:customView];
        
    }
    if ([self.title isEqualToString:@"扇形"]) {
        self.customView.type = QDDrawTypeshanxing;
        [self.view addSubview:self.customView];
    }
    if ([self.title isEqualToString:@"圆形"]) {
        self.customView.type = QDDrawTypeRounded;
        [self.view addSubview:self.customView];
    }
    if ([self.title isEqualToString:@"线"]) {
        self.customView.type = QDDrawTypeLine;
        [self.view addSubview:self.customView];
    }

    if ([self.title isEqualToString:@"不规则"]) {
        self.customView.type = QDDrawTypeBuguize;
        [self.view addSubview:self.customView];
    }
    if ([self.title isEqualToString:@"曲线"]) {
        self.customView.type = QDDrawTypeQuxian;
        [self.view addSubview:self.customView];
    }
    if ([self.title isEqualToString:@"画饼"]) {
        self.customView.type = QDDrawTypeHuabing;
        [self.view addSubview:self.customView];
    }
    if ([self.title isEqualToString:@"画文字"]) {
        self.customView.type = QDDrawTypeHuawenzi;
        [self.view addSubview:self.customView];
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.title isEqualToString:@"截屏"]) {
        [self jieping];
    }
}
- (void)shuiyin {
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 375, 375)];
    [self.view addSubview:imageView];
    
    UIImage *image = [UIImage imageNamed:@"login_logo@2x.png"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];
    
    NSString *string = @"水印";
    [string drawAtPoint:CGPointMake(0, 128) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:40],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    imageView.image = newImage;
    
    UIGraphicsEndImageContext();

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
#pragma mark - 
- (QDView *)customView {
    if (!_customView) {
        _customView = [[QDView alloc]initWithFrame:self.view.bounds];
        _customView.backgroundColor = [UIColor grayColor];
    }
    return _customView;
}



/*
 
 

 */
@end
