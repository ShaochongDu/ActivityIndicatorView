//
//  MyLayer.m
//  ActivityIndicatorView
//
//  Created by Shaochong Du on 16/9/2.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "MyLayer.h"

@implementation MyLayer

-(void)drawInContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 0.3, 0.2, 0.6, 1);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    CGContextMoveToPoint(ctx, CGRectGetMaxX(self.bounds)/2, CGRectGetMaxY(self.bounds));
    // 顺时针从-70度画到-110度 (0度是3点钟方向)
    CGContextAddArc(ctx, CGRectGetMaxX(self.bounds)/2, CGRectGetMaxY(self.bounds), 20,  -70 * M_PI / 180, -110 * M_PI / 180, 1);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
