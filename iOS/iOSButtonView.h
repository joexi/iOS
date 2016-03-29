//
//  iOSButtonView.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSButtonView : UIView
{
    UIImageView *_iconView;
    UILabel *_titleLabel;
    BOOL _onPress;
}

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) BOOL isSelected;

- (void)cancelAnimation;
@end
