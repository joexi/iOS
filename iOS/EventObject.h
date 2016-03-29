//
//  ddd.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/29.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventObject : NSObject
{
}
@property (nonatomic, weak) id target;
@property (nonatomic, weak) NSString *name;
@property (nonatomic, strong) void (^callback)();
@end
