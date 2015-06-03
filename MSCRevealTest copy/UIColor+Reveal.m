//
// Created by Marijn Schilling on 03/06/15.
// Copyright (c) 2015 marijn. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "UIColor+Reveal.h"



@implementation UIColor (Reveal)

+ (UIColor *)averageColorWithColor:(UIColor *)color1 andColor:(UIColor *)color2 alpha:(float)alpha {
//    alpha =  MIN( 1.f, MAX( 0.f, alpha ) );
    NSLog(@"alpha %f", alpha);
    float beta = 1.f - alpha;
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    CGFloat r = r1 * beta + r2 * alpha;
    CGFloat g = g1 * beta + g2 * alpha;
    CGFloat b = b1 * beta + b2 * alpha;

    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}
@end