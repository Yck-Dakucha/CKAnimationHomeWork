//
//  CKCircleView.m
//  CKAnimationHomeWork
//
//  Created by Yck on 16/8/2.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKCircleView.h"

@implementation CKCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleLayer = [CKCircleLayer layer];
        self.circleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.circleLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleLayer];
    }
    return self;
}

@end
