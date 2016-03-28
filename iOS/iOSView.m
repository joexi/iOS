//
//  iOSView.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "iOSView.h"
#import "iOSButtonView.h"
#import "iOSScrollerView.h"
#import "iOSBlurView.h"
#import "iOSAnimationHelper.h"

@implementation iOSView

- (id)init {
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    if (self) {
        _scrollView = [[iOSScrollerView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _scrollView.pagingEnabled = YES;
        _scrollView.directionalLockEnabled = YES;
        _scrollView.delegate = self;
        [_scrollView setScrollEnabled:YES];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [self addSubview:_scrollView];
        
        _contentView = [[UIView alloc] init];
        [_scrollView addSubview:_contentView];
        
        float degrees = 180;
        _scrollView.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        _contentView.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        [self setBackgroundColor:[UIColor colorWithRed:216./255. green:227./255. blue:190/255. alpha:1.0]];
        
//        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//        l.text = @"!111111" ;
//        [self addSubview:l];
        
        [_scrollView setNeedsDisplay];
        
        _blurView = [[iOSBlurView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _blurView.targetView = self;
        [self addSubview:_blurView];
        
        
    }
    return self;
}

- (void)dealloc {
    _scrollView = nil;
    _contentView = nil;
}

- (void)setPageCount:(NSUInteger)pageCount {
    _pageCount = pageCount;
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * pageCount, _scrollView.frame.size.height + 100)];
    [_contentView setFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
}

- (void)reload {
    for (int i = 0; i < self.pageCount; i++) {
        NSUInteger count = [self.delegate view:self numberOfSubviewsInPage:i];
        for (int j = 0; j < count; j++) {
            iOSButtonView *view = [self.delegate view:self viewAtIndex:j page:i];
            float dis = (self.frame.size.width - self.subViewSize.width * self.columnCount) / (self.columnCount + 1);
            view.frame = CGRectMake((j % 4 + 1) * dis + (j % 4) * self.subViewSize.width,
                                    (j / 4 + 1) * dis + (j / 4) * (self.subViewSize.height + 10) + 10,
                                    self.subViewSize.width,
                                    self.subViewSize.height);
            [_contentView addSubview:view];
        }
    }
}

- (void)redrawBlur:(float)percentage
{
    [_blurView removeFromSuperview];
    if (percentage > 0.05f) {
        [_blurView draw:percentage - 0.05f];
        [self addSubview:_blurView];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (UIView *v in _contentView.subviews) {
        [iOSAnimationHelper cancelAnimation:v];
    }
    
    if (scrollView.contentOffset.x != 0 &&
        scrollView.contentOffset.y != 0) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    NSLog(@"%f",scrollView.contentOffset.y);
    [self redrawBlur:scrollView.contentOffset.y];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
