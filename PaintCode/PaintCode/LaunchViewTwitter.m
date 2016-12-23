//
//  LaunchViewTwitter.m
//  PaintCode
//
//  Created by henvy on 23/12/2016.
//  Copyright © 2016 henvy. All rights reserved.
//

#import "LaunchViewTwitter.h"

@implementation LaunchViewTwitter


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
//    [self addLayerToLaunchView];
}
- (void)startLaunch
{
    [UIView animateWithDuration:1 animations:^{
        self.launchView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.launchView.transform = CGAffineTransformMakeScale(50, 50);
            
            self.launchView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.launchView removeFromSuperview];
            [self removeFromSuperview];
        }];;
    }];
}
-(void)addLayerToLaunchView
{
    self.launchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.launchView.backgroundColor = [UIColor clearColor];
    self.launchView.center = self.center;
    [self addSubview:self.launchView];
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.path = [self BezierPath].CGPath;
    layer.bounds = CGPathGetBoundingBox(layer.path);
    self.backgroundColor = [UIColor colorWithRed:0.18 green:0.70 blue:0.90 alpha:1.0];
    layer.position = CGPointMake(self.launchView.bounds.size.width / 2, self.launchView.bounds.size.height/ 2);
    layer.fillColor = [UIColor whiteColor].CGColor;
    [self.launchView.layer addSublayer:layer];
    
    [self performSelector:@selector(startLaunch) withObject:nil afterDelay:1.0];
}
-(UIBezierPath *)BezierPath
{
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed: 0.521 green: 0.521 blue: 0.521 alpha: 1];
    
    //// Page-1
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(49.61, 34.62)];
    [bezierPath addCurveToPoint: CGPointMake(35.76, 30.64) controlPoint1: CGPointMake(44.66, 33.85) controlPoint2: CGPointMake(38.57, 31.9)];
    [bezierPath addCurveToPoint: CGPointMake(29.98, 27.72) controlPoint1: CGPointMake(32.08, 29) controlPoint2: CGPointMake(30.38, 27.82)];
    [bezierPath addCurveToPoint: CGPointMake(26.57, 25.45) controlPoint1: CGPointMake(29.04, 27.47) controlPoint2: CGPointMake(28.21, 26.4)];
    [bezierPath addCurveToPoint: CGPointMake(19.58, 20.11) controlPoint1: CGPointMake(24.09, 24.01) controlPoint2: CGPointMake(21.99, 22.06)];
    [bezierPath addCurveToPoint: CGPointMake(9.97, 10.3) controlPoint1: CGPointMake(14.09, 15.69) controlPoint2: CGPointMake(9.97, 10.3)];
    [bezierPath addCurveToPoint: CGPointMake(7.62, 28.46) controlPoint1: CGPointMake(9.97, 10.3) controlPoint2: CGPointMake(6.05, 20.92)];
    [bezierPath addCurveToPoint: CGPointMake(16.08, 41.34) controlPoint1: CGPointMake(9.19, 36) controlPoint2: CGPointMake(16.24, 40.45)];
    [bezierPath addCurveToPoint: CGPointMake(6.69, 39.7) controlPoint1: CGPointMake(15.77, 43.11) controlPoint2: CGPointMake(6.69, 39.7)];
    [bezierPath addCurveToPoint: CGPointMake(7.67, 45.64) controlPoint1: CGPointMake(6.69, 39.7) controlPoint2: CGPointMake(6.74, 42.46)];
    [bezierPath addCurveToPoint: CGPointMake(12.08, 54.08) controlPoint1: CGPointMake(8.63, 48.95) controlPoint2: CGPointMake(10.76, 52.44)];
    [bezierPath addCurveToPoint: CGPointMake(24.25, 62.33) controlPoint1: CGPointMake(15.39, 58.19) controlPoint2: CGPointMake(24.25, 62.33)];
    [bezierPath addCurveToPoint: CGPointMake(20.75, 63.08) controlPoint1: CGPointMake(24.25, 62.33) controlPoint2: CGPointMake(23.27, 62.96)];
    [bezierPath addCurveToPoint: CGPointMake(14.86, 62.76) controlPoint1: CGPointMake(18.22, 63.2) controlPoint2: CGPointMake(14.86, 62.76)];
    [bezierPath addCurveToPoint: CGPointMake(21.38, 73.08) controlPoint1: CGPointMake(14.86, 62.76) controlPoint2: CGPointMake(15.99, 68.72)];
    [bezierPath addCurveToPoint: CGPointMake(35.76, 79.09) controlPoint1: CGPointMake(26.77, 77.43) controlPoint2: CGPointMake(35.76, 79.09)];
    [bezierPath addCurveToPoint: CGPointMake(20.46, 86.85) controlPoint1: CGPointMake(35.76, 79.09) controlPoint2: CGPointMake(28.27, 84.66)];
    [bezierPath addCurveToPoint: CGPointMake(3.39, 88.74) controlPoint1: CGPointMake(12.64, 89.05) controlPoint2: CGPointMake(3.39, 88.74)];
    [bezierPath addCurveToPoint: CGPointMake(21.68, 97.55) controlPoint1: CGPointMake(3.39, 88.74) controlPoint2: CGPointMake(11.09, 94.77)];
    [bezierPath addCurveToPoint: CGPointMake(48.84, 98.53) controlPoint1: CGPointMake(31.67, 100.17) controlPoint2: CGPointMake(44.44, 99.01)];
    [bezierPath addCurveToPoint: CGPointMake(72.94, 89.59) controlPoint1: CGPointMake(53.09, 98.06) controlPoint2: CGPointMake(64.43, 95.17)];
    [bezierPath addCurveToPoint: CGPointMake(89.18, 74.76) controlPoint1: CGPointMake(82.57, 83.27) controlPoint2: CGPointMake(89.18, 74.76)];
    [bezierPath addCurveToPoint: CGPointMake(100.57, 54.91) controlPoint1: CGPointMake(89.18, 74.76) controlPoint2: CGPointMake(98.04, 62.76)];
    [bezierPath addCurveToPoint: CGPointMake(103.81, 39.7) controlPoint1: CGPointMake(103.1, 47.06) controlPoint2: CGPointMake(103.28, 44.44)];
    [bezierPath addCurveToPoint: CGPointMake(104.02, 29.48) controlPoint1: CGPointMake(104.2, 36.24) controlPoint2: CGPointMake(104.02, 29.48)];
    [bezierPath addCurveToPoint: CGPointMake(110.4, 24) controlPoint1: CGPointMake(104.02, 29.48) controlPoint2: CGPointMake(107.9, 26.58)];
    [bezierPath addCurveToPoint: CGPointMake(115.39, 17.74) controlPoint1: CGPointMake(112.89, 21.42) controlPoint2: CGPointMake(115.39, 17.74)];
    [bezierPath addLineToPoint: CGPointMake(103.81, 20.66)];
    [bezierPath addLineToPoint: CGPointMake(109, 15.7)];
    [bezierPath addLineToPoint: CGPointMake(113.29, 8.07)];
    [bezierPath addCurveToPoint: CGPointMake(106.15, 11.1) controlPoint1: CGPointMake(113.29, 8.07) controlPoint2: CGPointMake(109.95, 9.69)];
    [bezierPath addCurveToPoint: CGPointMake(98.04, 13.75) controlPoint1: CGPointMake(102.36, 12.52) controlPoint2: CGPointMake(98.04, 13.75)];
    [bezierPath addCurveToPoint: CGPointMake(86.7, 7.25) controlPoint1: CGPointMake(98.04, 13.75) controlPoint2: CGPointMake(93.05, 9.04)];
    [bezierPath addCurveToPoint: CGPointMake(71.51, 7.55) controlPoint1: CGPointMake(80.35, 5.47) controlPoint2: CGPointMake(71.51, 7.55)];
    [bezierPath addCurveToPoint: CGPointMake(59.07, 19.68) controlPoint1: CGPointMake(71.51, 7.55) controlPoint2: CGPointMake(62.24, 12.68)];
    [bezierPath addCurveToPoint: CGPointMake(57.28, 30.47) controlPoint1: CGPointMake(57.31, 23.6) controlPoint2: CGPointMake(56.66, 27.57)];
    [bezierPath addCurveToPoint: CGPointMake(58.14, 35.08) controlPoint1: CGPointMake(57.83, 33.08) controlPoint2: CGPointMake(58.14, 35.08)];
    [bezierPath addCurveToPoint: CGPointMake(49.61, 34.62) controlPoint1: CGPointMake(58.14, 35.08) controlPoint2: CGPointMake(53.72, 35.25)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    bezierPath.usesEvenOddFillRule = YES;
    
    [color1 setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    return bezierPath;
}
@end
