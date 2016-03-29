//
//  iOSButtonView.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "iOSButtonView.h"
#import "Global.h"
#import "iOSAnimationHelper.h"
#import "EventManager.h"
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
        
        [self setUserInteractionEnabled:YES];
        
//        UILongPressGestureRecognizer *gr = [[UILongPressGestureRecognizer alloc] initWithTarget:self
//                                                                                         action:@selector(longPress:)];
//        
//        [self addGestureRecognizer:gr];
        
    }
    return self;
}

- (void)cancelAnimation {
    [iOSAnimationHelper cancelAnimation:self];
}

- (void)shake {
    [iOSAnimationHelper shake:self];
}

- (void)sizeUp {
    [iOSAnimationHelper sizeUp:self];
}

- (void)sizeDown {
    [iOSAnimationHelper sizeDown:self];
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _onPress = YES;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(longPress) object:nil];
    [self performSelector:@selector(longPress) withObject:nil afterDelay:0.5];
}

- (void)longPress {
    [[EventManager sharedManager] sendEvent:@"EVENT_SHAKE"];
    if (_onPress) {
        self.isSelected = YES;
        [self sizeUp];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _onPress = false;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(longPress) object:nil];
    [self sizeDown];
     _onPress = NO;
}

//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"????");
//    [self sizeDown];
//    _touchBegin = NO;
//}
@end
