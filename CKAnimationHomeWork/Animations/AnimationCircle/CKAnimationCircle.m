//
//  CKAnimationCircle.m
//  CKAnimationHomeWork
//
//  Created by Yck on 16/8/2.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "CKAnimationCircle.h"
#import "CKCircleView.h"

@interface CKAnimationCircle ()

@property (weak, nonatomic) IBOutlet UILabel *currentValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic, strong) CKCircleView *circleView;

@end

@implementation CKAnimationCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.circleView = [[CKCircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 320/2, self.view.frame.size.height/2 - 320/2, 320, 320)];
    [self.view addSubview:self.circleView];
    self.circleView.circleLayer.progress = self.slider.value;
}


- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.currentValueLabel.text = [NSString stringWithFormat:@"Current:  %f",sender.value];
    self.circleView.circleLayer.progress = sender.value;
}

@end
