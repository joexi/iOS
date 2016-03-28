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
        
        [self setBackgroundColor:[UIColor colorWithRed:216./255. green:227./255. blue:190/255. alpha:1.0]];
    }
    return self;
}

- (void)dealloc {
    
}

- (void)setPageCount:(NSUInteger)pageCount {
    _pageCount = pageCount;
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * pageCount, _scrollView.frame.size.height + 100)];
}

- (void)reload {
    for (int i = 0; i < self.pageCount; i++) {
        NSUInteger count = [self.delegate view:self numberOfSubviewsInPage:i];
        for (int j = 0; j < count; j++) {
            iOSButtonView *view = [self.delegate view:self viewAtIndex:j page:i];
            float dis = (self.frame.size.width - self.subViewSize.width * self.columnCount) / (self.columnCount + 1);
            view.frame = CGRectMake((j % 4 + 1) * dis + (j % 4) * self.subViewSize.width,
                                    (j / 4 + 1) * dis + (j / 4) * (self.subViewSize.height + 10),
                                    self.subViewSize.width,
                                    self.subViewSize.height);
            [_scrollView addSubview:view];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x != 0 &&
        scrollView.contentOffset.y != 0) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
