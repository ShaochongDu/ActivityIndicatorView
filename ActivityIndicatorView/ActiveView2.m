//
//  ActiveView2.m
//  ActivityIndicatorView
//
//  Created by Shaochong Du on 16/9/2.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "ActiveView2.h"

@implementation ActiveView2

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor magentaColor];
        
        CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
        repLayer.frame = self.bounds;
        [self.layer addSublayer:repLayer];
        
        CALayer *layer = [CALayer layer];
        layer.bounds = CGRectMake(0, 0, 10, 10);
        layer.cornerRadius = 5;
        layer.masksToBounds = YES;
        layer.transform = CATransform3DMakeScale(0, 0, 0);
        // 第一个layer的位置
        layer.position = CGPointMake(frame.size.width/2, 5);
        layer.backgroundColor = [UIColor greenColor].CGColor;
        [repLayer addSublayer:layer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.fromValue = @1;
        animation.toValue = @0.2;
        CGFloat duration = 1.2;
        animation.duration = duration;
        animation.repeatCount = CGFLOAT_MAX;
        [layer addAnimation:animation forKey:nil];
        
        int count = 12;
        // 360度分成12份
        CGFloat angle = M_PI*2/count;
        // 设置子层总数
        repLayer.instanceCount = count;
        // 每隔angle弧度放置一个layer层
        repLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
        // 每个子层动画延迟时长
        repLayer.instanceDelay = duration/count;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
