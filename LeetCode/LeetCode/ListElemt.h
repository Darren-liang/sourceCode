//
//  ListElemt.h
//  LeetCode
//
//  Created by liangweidong on 2020/4/16.
//  Copyright © 2020 liangweidong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListElemt : NSObject{
    @public int value;
    @public ListElemt *next;
}
//+(instancetype)ListElemtMake:(int)value Next:(ListElemt *)next;
@end

NS_ASSUME_NONNULL_END
