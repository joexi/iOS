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
@class iOSBlurView;
@protocol iOSViewDeleage <NSObject>

- (NSUInteger)view:(iOSView *)view numberOfSubviewsInPage:(NSUInteger)page;


- (iOSButtonView *)view:(iOSView *)view viewAtIndex:(NSUInteger)index page:(NSUInteger)page;

@end

typedef enum iOSViewStatus {
    none = 0,
    selected = 1
}iOSViewStatus;

@interface iOSView : UIView<UIScrollViewDelegate>
{
    NSMutableArray  *_buttons;
    iOSScrollerView *_scrollView;
    iOSBlurView *_blurView;
    
    UIView *_contentView;
    NSUInteger _pageCount;
    iOSViewStatus _status;
}
@property (nonatomic, weak) id <iOSViewDeleage> delegate;
@property (nonatomic, assign) NSUInteger pageCount;
@property (nonatomic, assign) NSUInteger columnCount;
@property (nonatomic, assign) CGSize subViewSize;
@property (nonatomic, assign) iOSViewStatus status;
- (void)reload;
@end
