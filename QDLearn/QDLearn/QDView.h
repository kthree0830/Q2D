//
//  QDView.h
//  QDLearn
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, QDDrawType) {
    QDDrawTypeRect,//矩形
    QDDrawTypeshanxing,//扇形
    QDDrawTypeRounded//圆形
};
@interface QDView : UIView
@property (nonatomic, assign)QDDrawType type;
@end
