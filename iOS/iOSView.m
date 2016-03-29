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
#import "Global.h"
#import "EventManager.h"
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
        _scrollView.transform = CGAffineTransformMakeRotation(degrees * M_PI / 180);
        _contentView.transform = CGAffineTransformMakeRotation(degrees * M_PI / 180);
        [self setBackgroundColor:COLOR_BG];

        [_scrollView setNeedsDisplay];
        
        _blurView = [[iOSBlurView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _blurView.targetView = self;
        [self addSubview:_blurView];
        [[EventManager sharedManager] addEvent:@"EVENT_SHAKE" target:self callback:^{
            [self startShake];
        }];
        
        
    }
    return self;
}

- (void)dealloc {
    [[EventManager sharedManager] removeEvent:@"EVENT_SHAKE" target:self];
    _scrollView = nil;
    _contentView = nil;
}

- (void)setPageCount:(NSUInteger)pageCount {
    _pageCount = pageCount;
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * pageCount, _scrollView.frame.size.height + 100)];
    [_contentView setFrame:CGRectMake(0, 0, _scrollView.frame.size.width * pageCount, _scrollView.frame.size.height)];
}

- (void)setStatus:(iOSViewStatus)status {
    if (_status != status) {
        _status = status;
        switch (status) {
            case none:
                
                break;
            case selected:
                
                break;
            default:
                break;
        }
    }
}

- (void)reload {
    for (UIView *child in _contentView.subviews) {
        [child removeFromSuperview];
    }
    
    for (int i = 0; i < self.pageCount; i++) {
        NSUInteger count = [self.delegate view:self numberOfSubviewsInPage:i];
//        UIView *parent = [[UIView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
//        [parent setBackgroundColor:[UIColor colorWithRed:i green:i/2 blue:0 alpha:1]];
//        [_contentView addSubview:parent];
        int displayIndex = self.pageCount - i - 1;
        for (int j = 0; j < count; j++) {
            iOSButtonView *view = [self.delegate view:self viewAtIndex:j page:displayIndex];
            float dis = (self.frame.size.width - self.subViewSize.width * self.columnCount) / (self.columnCount + 1);
            view.frame = CGRectMake(i * self.frame.size.width + (j % 4 + 1) * dis + (j % 4) * self.subViewSize.width,
                                    (j / 4 + 1) * dis + (j / 4) * (self.subViewSize.height + 10) + 10,
                                    self.subViewSize.width,
                                    self.subViewSize.height);
            
            
            [_contentView addSubview:view];
        }
    }
    
    [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width * (self.pageCount - 1), 0, self.frame.size.width, self.frame.size.height) animated:NO];
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
    
    [self cancelAnimation];
    
    if ((int)scrollView.contentOffset.x % (int)scrollView.frame.size.width != 0 &&
        scrollView.contentOffset.y != 0) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }
    NSLog(@"%f, %f" ,scrollView.contentOffset.x, scrollView.contentOffset.y);
    [self redrawBlur:scrollView.contentOffset.y];
}


- (void)cancelAnimation {
    for (iOSButtonView *v in _contentView.subviews) {
        [v cancelAnimation];
    }
}

- (void)startShake {
    for (UIView *v in _contentView.subviews) {
        [iOSAnimationHelper shake:v];
    }
}

@end
