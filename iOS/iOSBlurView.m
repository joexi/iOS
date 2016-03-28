//
//  iOSBlurView.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/28.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "iOSBlurView.h"
#import "iOSBlurHelper.h"
@implementation iOSBlurView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)draw:(float)percentage {
    float blur = percentage / 200.0;
    self.image = [iOSBlurHelper getImage:self.targetView blur:blur];
}
@end
