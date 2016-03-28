//
//  iOSView.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class iOSView;
@class iOSButtonView;
@class iOSTouchSwallowView;
@class iOSScrollerView;

@protocol iOSViewDeleage <NSObject>

- (NSUInteger)view:(iOSView *)view numberOfSubviewsInPage:(NSUInteger)page;


- (iOSButtonView *)view:(iOSView *)view viewAtIndex:(NSUInteger)index page:(NSUInteger)page;

@end


@interface iOSView : UIView<UIScrollViewDelegate>
{
    NSMutableArray  *_buttons;
    iOSScrollerView *_scrollView;
    NSUInteger _pageCount;
}
@property (nonatomic, weak) id <iOSViewDeleage> delegate;
@property (nonatomic, assign) NSUInteger pageCount;
@property (nonatomic, assign) NSUInteger columnCount;
@property (nonatomic, assign) CGSize subViewSize;
- (void)reload;
@end
