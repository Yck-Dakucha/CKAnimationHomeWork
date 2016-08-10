//
//  CKCurveLayer.m
//  CKAnimationHomeWork
//
//  Created by Yck on 16/8/9.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKCurveLayer.h"
#import <UIKit/UIKit.h>

@implementation CKCurveLayer


- (void)drawInContext:(CGContextRef)ctx {
    [super drawInContext:ctx];
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath *curvePath1 = [UIBezierPath bezierPath];
    curvePath1.lineCapStyle = kCGLineCapRound;
    curvePath1.lineJoinStyle = kCGLineJoinRound;
    curvePath1.lineWidth = 2.0f;
    
    //箭头Path
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    if (self.progress <= 0.5) {
        CGPoint A;
    }
}


@end
