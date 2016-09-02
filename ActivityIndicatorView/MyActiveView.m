//
//  MyActiveView.m
//  ActivityIndicatorView
//
//  Created by Shaochong Du on 16/9/2.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "MyActiveView.h"
#import "MyLayer.h"

@implementation MyActiveView
{
    MyLayer *layer;
    CABasicAnimation *opacityAnim;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor magentaColor];
        CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
        repLayer.frame = self.bounds;
        [self.layer addSublayer:repLayer];
        // 画一个扇形的layer
        layer = [MyLayer layer];
        layer.frame = CGRectMake(0, 0, 22, 22);
        // 调用layer的drawInContext:进行绘图
        [layer setNeedsDisplay];
        // 设置2倍比率，防止边缘出现锯齿
        layer.contentsScale = 2;
        // 透明
        layer.opacity = 0;
        // 设置锚点
        layer.anchorPoint = CGPointMake(0.5, 0);
        // 设置第一个扇形layer的位置
        layer.position = CGPointMake(self.bounds.size.width/2, 0);
        [repLayer addSublayer:layer];
        // 设置透明度渐变的动画
        opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
        // 透明度从1变为0
        opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
        opacityAnim.toValue = [NSNumber numberWithFloat:0];
        opacityAnim.removedOnCompletion = YES;
        opacityAnim.repeatCount = MAXFLOAT;
        CGFloat duration = 0.7;
        opacityAnim.duration = duration;
        [layer addAnimation:opacityAnim forKey:nil];
        int count = 8;
        CGFloat angle = M_PI * 2 / count;
        // 复制8个
        repLayer.instanceCount = count;
        // 绕z轴每隔angle角度复制一个
        repLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
        // 复制子层动画延迟时长
        repLayer.instanceDelay = duration / count;
        // 此视图绕z轴旋转22度
        CATransform3D transform = CATransform3DRotate(self.layer.transform, 22*M_PI/180, 0, 0, 1);
        self.layer.transform = transform;
        // 监听App进入前后台
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stop) name:UIApplicationWillResignActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(start) name:UIApplicationDidBecomeActiveNotification object:nil];
        
    }
    return self;
}

// 停止动画
- (void)stop {
    [layer removeAllAnimations];
}
// 开始动画
- (void)start {
    [layer addAnimation:opacityAnim forKey:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
