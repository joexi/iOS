//
//  ViewController.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "ViewController.h"
#import "iOSButtonView.h"
@interface ViewController ()

@end

@implementation ViewController


- (id)init {
    self = [super init];
    if (self) {
        _view = [[iOSView alloc] init];
        _view.pageCount = 2;
        _view.columnCount = 4;
        _view.subViewSize = CGSizeMake(60, 60);
        _view.delegate = self;
        [_view reload];
        self.view = _view;
        
    }
    return self;
}

- (void)dealloc {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma delegate of iOSView

- (NSUInteger)view:(iOSView *)view numberOfSubviewsInPage:(NSUInteger)page {
    if (page == 1) {
        return 10;
    }
    return 0;
}

- (iOSButtonView *)view:(iOSView *)view viewAtIndex:(NSUInteger)index page:(NSUInteger)page {
    iOSButtonView *btnView = [[iOSButtonView alloc] init];
    return btnView;
}


@end
