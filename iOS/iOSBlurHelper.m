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
    
    // setup context
//    UIGraphicsBeginImageContextWithOptions(targetView.bounds.size, NO, 0.0f); // use same scale factor as device
//    CGContextRef cc = UIGraphicsGetCurrentContext();
//    
//    // render view
//    [targetView.layer renderInContext:cc];
//    
//    // get reslting image
//    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return result;
//
//    
//    UIGraphicsBeginImageContext(targetView.bounds.size);
//    [targetView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
//    return nil;
//    UIGraphicsBeginImageContextWithOptions(targetView.bounds.size, targetView.opaque, 0.0);
//    [targetView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return img;
    
//    UIGraphicsBeginImageContext(targetView.bounds.size);
//    [targetView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return img;
    
//    UIGraphicsBeginImageContextWithOptions(targetView.bounds.size, NO, 0.0);
//    [targetView drawViewHierarchyInRect:targetView.bounds afterScreenUpdates:YES];
//    UIImage * snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
////    return snapshotImage;
//    CGSize size = targetView.frame.size;
//    UIGraphicsBeginImageContext(size);
//    CGContextRef c = UIGraphicsGetCurrentContext();
//    [targetView.layer drawInContext:c];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
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
