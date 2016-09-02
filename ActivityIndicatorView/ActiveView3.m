//
//  ActiveView3.m
//  ActivityIndicatorView
//
//  Created by Shaochong Du on 16/9/2.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "ActiveView3.h"

@implementation ActiveView3

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor magentaColor];
        
         // 设置直径为self宽/高的最小值
        CGFloat diameter = MIN(frame.size.width, frame.size.height);
        CAShapeLayer *sLayer = [CAShapeLayer layer];
        sLayer.anchorPoint = CGPointMake(0.5, 0.5);
        sLayer.frame = CGRectMake(0, 0, diameter, diameter);
        sLayer.strokeColor = [UIColor greenColor].CGColor;
        sLayer.fillColor = [UIColor clearColor].CGColor;
        sLayer.lineWidth = 2;
        
        CGFloat raduis = diameter/2;
        UIBezierPath *roundPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(raduis, raduis) radius:raduis startAngle:0 endAngle:(2*M_PI - M_PI_4) clockwise:YES];
        sLayer.path = roundPath.CGPath;
        [self.layer addSublayer:sLayer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = @0;
        animation.toValue = @(2*M_PI);
        animation.duration = 1.0f;
        animation.repeatCount = CGFLOAT_MAX;
        [sLayer addAnimation:animation forKey:nil];
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
