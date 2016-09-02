//
//  ActiveView1.m
//  ActivityIndicatorView
//
//  Created by Shaochong Du on 16/9/2.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "ActiveView1.h"

@implementation ActiveView1

-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor magentaColor];
        
        CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
        repLayer.frame = self.bounds;
        [self.layer addSublayer:repLayer];
        
        CALayer *layer = [CALayer layer];
        // 宽度5等分之后创建3个repLayer
        CGFloat width = frame.size.width/5;
        CGFloat height = frame.size.height;
        layer.bounds = CGRectMake(0, 0, width, height);
        // 第一个layer的位置
        layer.position = CGPointMake(width/2, height/2);
        layer.backgroundColor = [UIColor greenColor].CGColor;
        [repLayer addSublayer:layer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        animation.fromValue = @1;
        animation.toValue = @0.3;
        animation.duration  = 0.4;
        animation.autoreverses = YES;
        animation.repeatCount = CGFLOAT_MAX;
        [layer addAnimation:animation forKey:nil];
        // 复制8个
        repLayer.instanceCount = 3;
        // 复制子层动画延迟时长
        repLayer.instanceDelay = 0.5;
        // x轴上每隔self.frame.size.width/5*2距离，放置一个repLayer
        repLayer.instanceTransform = CATransform3DMakeTranslation(frame.size.width/5*2, 0, 0);
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
