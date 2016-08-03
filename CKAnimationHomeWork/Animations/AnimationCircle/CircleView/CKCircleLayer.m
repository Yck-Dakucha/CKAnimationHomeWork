//
//  CKCircleLayer.m
//  CKAnimationHomeWork
//
//  Created by Yck on 16/8/2.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKCircleLayer.h"
#import <UIKit/UIKit.h>

typedef enum MovingPoint {
    POINT_D,
    POINT_B
}MovingPoint;

#define outsideRectSize 90

@interface CKCircleLayer ()
/**
 *  外接矩形
 */
@property (nonatomic, assign) CGRect outsideRect;
/**
 *  记录上次的progress，方便做差得出滑动方向
 */
@property (nonatomic, assign) CGFloat lastProgress;
/**
 *  实时记录滑动方向
 */
@property(nonatomic,assign)MovingPoint movePoint;

@end

@implementation CKCircleLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lastProgress = 0.5;
    }
    return self;
}

- (instancetype)initWithLayer:(CKCircleLayer *)layer {
    self = [super initWithLayer:layer];
    if (self) {
        self.outsideRect = layer.outsideRect;
        self.lastProgress = layer.lastProgress;
        self.movePoint = layer.movePoint;
    }
    return self;
}
//           A
//           __   c1
//         /    \
//        /      \   c2
//      D|   圆   | B
//        \      /
//         \ __ /
//           C
- (void)drawInContext:(CGContextRef)ctx {
    //顶点ABCD到控制点的距离,AB圆弧之间的控制点为c1,c2
    CGFloat offset = self.outsideRect.size.width * 2 * tan(M_PI/8)/3;
    
    //方便下方计算各点坐标，先算出外接矩形的中心点坐标,注意origin是顶点坐标
    CGPoint rectCenter = CGPointMake(self.outsideRect.origin.x + self.outsideRect.size.width/2 , self.outsideRect.origin.y + self.outsideRect.size.height/2);
    
    //各点的坐标
    CGPoint pointA = CGPointMake(rectCenter.x, self.outsideRect.origin.y);
    CGPoint pointB = CGPointMake(rectCenter.x + self.outsideRect.size.width/2, rectCenter.y);
    CGPoint pointC = CGPointMake(rectCenter.x, self.outsideRect.origin.y + self.outsideRect.size.height);
    CGPoint pointD = CGPointMake(rectCenter.x - self.outsideRect.size.width/2, rectCenter.y);
    
    //控制点坐标
    CGPoint c1 = CGPointMake(pointA.x + offset, pointA.y);
    CGPoint c2 = CGPointMake(pointB.x, pointB.y - offset);
    CGPoint c3 = CGPointMake(pointB.x, pointB.y + offset);
    CGPoint c4 = CGPointMake(pointC.x + offset, pointC.y);
    CGPoint c5 = CGPointMake(pointC.x - offset, pointC.y);
    CGPoint c6 = CGPointMake(pointD.x, pointD.y + offset);
    CGPoint c7 = CGPointMake(pointD.x, pointD.y - offset);
    CGPoint c8 = CGPointMake(pointA.x - offset, pointA.y);
    
    //画出圆形
    UIBezierPath *ovalPath = [UIBezierPath bezierPath];
    [ovalPath moveToPoint:pointA];
    [ovalPath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
    [ovalPath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
    [ovalPath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
    [ovalPath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
    [ovalPath closePath];
    
    CGContextAddPath(ctx, ovalPath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineDash(ctx, 0, NULL, 0);
    CGContextDrawPath(ctx, kCGPathFillStroke); //同时给线条和线条包围的内部区域填充颜色
    
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    CGFloat origin_x = self.position.x - outsideRectSize/2 + (progress - 0.5)*(self.frame.size.width - outsideRectSize);
    CGFloat origin_y = self.position.y - outsideRectSize/2;
    
    self.outsideRect = CGRectMake(origin_x, origin_y, outsideRectSize, outsideRectSize);
    
    [self setNeedsDisplay];
}

@end
