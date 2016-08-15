//
//  CKCurveLayer.m
//  CKAnimationHomeWork
//
//  Created by Yck on 16/8/9.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKCurveLayer.h"
#import <UIKit/UIKit.h>


#define kRadius 20
#define kLineLength 30
#define CenterY  self.frame.size.height/2
//箭头的夹角
#define kDegree M_PI/3
#define kArrowLength 3

@implementation CKCurveLayer


- (void)drawInContext:(CGContextRef)ctx {
    [super drawInContext:ctx];
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath *curvePath1 = [UIBezierPath bezierPath];
    curvePath1.lineCapStyle = kCGLineCapRound;
    curvePath1.lineJoinStyle = kCGLineJoinRound;
    curvePath1.lineWidth = 2.0f;
    
    //注意点移动的距离就是  CenterY - kLineLength
    //左边箭头Path
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    if (self.progress <= 0.5) {
        //下方箭头直线尾部
        CGPoint pointA = CGPointMake(self.frame.size.width/2 - kRadius, CenterY - (1 - 2*self.progress)*(CenterY - kLineLength) + kLineLength);
        //下方箭头直线顶点
        CGPoint pointB = CGPointMake(self.frame.size.width/2 - kRadius, CenterY - (1 - 2*self.progress)*(CenterY - kLineLength));
        [curvePath1 moveToPoint:pointA];
        [curvePath1 addLineToPoint:pointB];
        
        //画出箭头
        CGPoint pointC = CGPointMake(pointB.x - kArrowLength * sinf(kDegree), pointB.y + kArrowLength * cosf(kDegree));
        [curvePath1 addLineToPoint:pointC];
    }else {
        
    }
}


@end
