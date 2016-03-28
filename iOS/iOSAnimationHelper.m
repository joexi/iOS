//
//  iOSAnimationHelper.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/28.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "iOSAnimationHelper.h"

@implementation iOSAnimationHelper
static iOSAnimationHelper *_sharedHelper;

+ (iOSAnimationHelper *)shadredHelper {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _sharedHelper = [[iOSAnimationHelper alloc] init];
    });
    return _sharedHelper;
}

+ (void)cancelAnimation:(UIView *)view {
    [view.layer removeAllAnimations];
}

+ (void)shakeOver:(UIView *)view{
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.01f animations:^{
        view.transform = CGAffineTransformMakeRotation(0);
    }];
    [UIView commitAnimations];
    
}
+ (void)shake:(UIView *)view {
    view.layer.speed = 2.5;
    [UIView beginAnimations:nil context:nil];
    float degrees = (arc4random()%30)/10.0;

    [UIView animateWithDuration:0.01f animations:^{
        
        view.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
    } completion:^(BOOL finished) {
        if (finished) {
            [iOSAnimationHelper shakeBack:view value:degrees];
        }
        else {
            [iOSAnimationHelper shakeOver:view];
        }
    } ];
    [UIView commitAnimations];
}

+ (void)shakeBack:(UIView *)view value:(float)value{
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.01f animations:^{
        float degrees = -value;
        view.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
    } completion:^(BOOL finished) {
        if (finished) {
            [iOSAnimationHelper shake:view];
        }
        else {
            [iOSAnimationHelper shakeOver:view];
        }
    }];
    [UIView commitAnimations];
}


@end
