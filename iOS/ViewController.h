//
//  ViewController.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/25.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSView.h"
@interface ViewController : UIViewController<iOSViewDeleage>
{
    iOSView *_view;
}
@end

