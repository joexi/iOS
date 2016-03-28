# iOS
Application iOS like
## PROVIDES
* App display and layout
* Blur effect when dragging
* Multi page

## TODO LIST
* Shotcut bar
* Search bar
* App Group

![](https://github.com/joexi/iOS/blob/master/readme.gif?raw=true)

## HOW TO USE
* create a iOSView
``` objc
_view = [[iOSView alloc] init];
_view.pageCount = 2;
_view.columnCount = 4;
_view.subViewSize = CGSizeMake(60, 60);
_view.delegate = self;
[_view reload];
```

* implement the delegate protocal
```
- (NSUInteger)view:(iOSView *)view numberOfSubviewsInPage:(NSUInteger)page {
    return 1;
}

- (iOSButtonView *)view:(iOSView *)view viewAtIndex:(NSUInteger)index page:(NSUInteger)page {
    iOSButtonView *btnView = [[iOSButtonView alloc] init];
    return btnView;
}
```
