//
//  iOSButtonView.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "iOSButtonView.h"
#import "Global.h"

@implementation iOSButtonView

- (id)init {
    self = [super init];
    if (self) {
        _iconView = [[UIImageView alloc] init];
        [_iconView setBackgroundColor:[UIColor colorWithRed:196./255. green:214./255. blue:158./255. alpha:1.]];
        [_iconView.layer setCornerRadius:10];
        [self addSubview:_iconView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"xxXX";
        _titleLabel.textColor = COLOR_TEXT_TITLE;
        _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _iconView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _titleLabel.frame = CGRectMake(0, frame.size.height, frame.size.width, 20);
    
}
- (void)dealloc {

}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (NSString *)title {
    return _titleLabel.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
