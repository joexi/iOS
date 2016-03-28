//
//  iOSBlurView.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/28.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSBlurView : UIImageView

@property (nonatomic, assign) UIView *targetView;


- (void)draw:(float)percentage;
@end
