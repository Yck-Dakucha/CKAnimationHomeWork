//
//  CKLabelView.h
//  CKAnimationHomeWork
//
//  Created by Yck on 16/8/9.
//  Copyright © 2016年 CK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CKPULLINGSTATE) {
    UP,
    DOWN
};

@interface CKLabelView : UIView

/**
 *  进度0-1
 */
@property (nonatomic, assign) CGFloat progress;
/**
 *  是否正在刷新
 */
@property (nonatomic, assign) BOOL loading;
/**
 *  上下拉状态
 */
@property (nonatomic, assign) CKPULLINGSTATE state;

@end
