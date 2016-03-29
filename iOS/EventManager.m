//
//  OBManager.m
//  iOS
//
//  Created by 骏飞 奚 on 16/3/29.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "EventManager.h"

@implementation EventManager


static EventManager *_sharedManager;


+ (EventManager *)sharedManager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _sharedManager = [[EventManager alloc] init];
    });
    return _sharedManager;
}

- (id)init {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addEvent:(NSString *)event target:(id)target callback:(void (^)())cb {
    EventObject *obj = [[EventObject alloc] init];
    obj.name = event;
    obj.target = target;
    obj.callback = cb;
    [_array addObject:obj];
}

- (void)removeEvent:(NSString *)event target:(id)target {
    for (int i = 0; i < _array.count; i++) {
        EventObject *eo = [_array objectAtIndex:i];
        if ([eo.name isEqualToString:event] && eo.target == target) {
            [_array removeObjectAtIndex:i];
            i--;
        }
    }
}


- (void)sendEvent:(NSString *)event {
    for (EventObject *eo in _array) {
        if ([eo.name isEqualToString:event]) {
            eo.callback();
        }
    }
}

@end
