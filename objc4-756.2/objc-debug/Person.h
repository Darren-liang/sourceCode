//
//  Person.h
//  AFNetWorkingCode
//
//  Created by liangweidong on 2020/4/13.
//  Copyright © 2020 liangweidong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
//{
//    @public int _a;
//
//    @public int _c;
//    @public char _d;
//    @public char _e;
//}

@property (nonatomic, assign) double e;
@property (nonatomic, strong) NSString *str;
@property (nonatomic, assign) double d;
@property (nonatomic, assign) char c;
@property (nonatomic, assign) char b;
@property (nonatomic, assign) int a;

@end

NS_ASSUME_NONNULL_END
