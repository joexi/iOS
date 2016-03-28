//
//  iOSBlurHelper.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/28.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "iOSBlurHelper.h"
#import "UIImage+ImageEffects.h"
@implementation iOSBlurHelper

+ (void)renderSubviews:(UIView *)view context:(CGContextRef)context{
    [view.layer renderInContext:context];
    
    for (UIView *v in view.subviews) {
        [iOSBlurHelper renderSubviews:v context:context];
    }
}

+ (UIImage*)getImage:(UIView *)targetView blur:(float)blur
{
    UIGraphicsBeginImageContextWithOptions(targetView.bounds.size, YES, 0.0f); // use same scale factor as device
    CGContextRef cc = UIGraphicsGetCurrentContext();

    // render view
    [targetView.layer renderInContext:cc];

    // get reslting image
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
//    return result;
    return [result applyBlurWithRadius:2 tintColor:[UIColor colorWithWhite:0.5 alpha:blur] saturationDeltaFactor:1 maskImage:nil];
}



@end
