//
//  HumanView.m
//  Human
//
//  Created by BourbonZ on 15/6/10.
//  Copyright (c) 2015年 Bourbon. All rights reserved.
//

#import "HumanView.h"
#define r 100
#import <CoreGraphics/CoreGraphics.h>
@implementation HumanView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    ///获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawBody(context,rect);
    drawEyy(context,rect);
    drawMouth(context,rect);
}

///画身体
void drawBody(CGContextRef context,CGRect rect)
{
    ///设置颜色
    [[UIColor yellowColor] set];
    
    CGFloat startX = 100;
    CGFloat startY = 120;
    ///将画笔移动到指定位置
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat circleUpX = startX + r;
    CGFloat circleUpY = startY;
    ///画弧，参数分别为图形上下文，圆心x，圆心y，半径，起始弧度，终止弧度，方向(1是顺时针，0是逆时针)
    CGContextAddArc(context, circleUpX, circleUpY, r, 0, M_PI, 1);
    
    CGFloat lineX = circleUpX +r;
    CGFloat lineY = circleUpY;
    ///划线
    CGContextAddLineToPoint(context, lineX, lineY);
    
    CGFloat circleDownX = lineX - r;
    CGFloat circleDownY = lineY + r;
    CGContextAddArc(context, circleDownX, circleDownY, r, 0, M_PI, 0);
    
    ///合并线条
    CGContextClosePath(context);
    ///绘制图形,并填充颜色
    CGContextFillPath(context);
}
///画嘴巴
void drawMouth(CGContextRef context,CGRect rect)
{
    CGFloat mouthStartX = 150;
    CGFloat mouthStartY = 250;
    CGContextMoveToPoint(context, mouthStartX, mouthStartY);
    
    CGFloat mouthEndX = 250;
    CGFloat mouthEndY = 250;
    CGFloat controlX = 200;
    CGFloat controlY = 270;
    ///画贝塞尔曲线，参数分别为图形上下文，控制点x。控制点y，结束点x，结束点y（一个控制点）
    ///两个控制点的方法为CGContextAddCurveToPoint
    CGContextAddQuadCurveToPoint(context, controlX, controlY, mouthEndX, mouthEndY);
    ///设置颜色
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    ///设置线宽
    CGContextSetLineWidth(context, 2);
    ///绘图但只画边框
    CGContextStrokePath(context);
    
}
///画眼睛
void drawEyy(CGContextRef context,CGRect rect)
{
    CGFloat startX = 100;
    CGFloat startY = 120;
    CGContextMoveToPoint(context, startX, startY);
    CGContextSetLineWidth(context, 15);
    
    CGFloat endX = 100 + r * 2;
    CGFloat endY = 120;
    CGContextAddLineToPoint(context, endX, endY);
    
    [[UIColor blackColor] set];

    CGContextStrokePath(context);
    
    
    CGFloat blackEyyX = startX + r;
    CGFloat blackEyyY = startY;
    CGContextAddArc(context, blackEyyX, blackEyyY, r * 0.5, 0, M_PI * 2, 1);
    CGContextFillPath(context);

    CGFloat whiteEyyX = blackEyyX;
    CGFloat whiteEyyY = blackEyyY;
    [[UIColor whiteColor] set];
    CGContextAddArc(context, whiteEyyX, whiteEyyY, r * 0.4, 0, M_PI * 2, 1);
    CGContextFillPath(context);

    CGFloat grayEyyX = blackEyyX;
    CGFloat grayEyyY = blackEyyY;
    [[UIColor grayColor] set];
    CGContextAddArc(context, grayEyyX, grayEyyY, r * 0.2, 0, M_PI * 2, 1);
    
    CGContextFillPath(context);
    

}
@end
