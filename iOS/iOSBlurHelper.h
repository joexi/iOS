//
//  iOSBlurHelper.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/28.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iOSBlurHelper : NSObject


+ (UIImage*)getImage:(UIView *)targetView blur:(float)blur;
@end
