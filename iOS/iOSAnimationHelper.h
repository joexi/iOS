//
//  iOSAnimationHelper.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/28.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iOSAnimationHelper : NSObject


+ (void)shake:(UIView *)view;

+ (void)cancelAnimation:(UIView *)view;

+ (void)sizeUp:(UIView *)view;

+ (void)sizeDown:(UIView *)view;
@end
