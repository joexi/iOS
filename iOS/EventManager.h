//
//  OBManager.h
//  iOS
//
//  Created by 骏飞 奚 on 16/3/29.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventObject.h"

@interface EventManager : NSObject
{
    NSMutableArray<EventObject *> *_array;
}
+ (EventManager *)sharedManager;

- (void)addEvent:(NSString *)event target:(id)target callback:(void (^)())cb;
- (void)sendEvent:(NSString *)event;
- (void)removeEvent:(NSString *)event target:(id)target;
@end
