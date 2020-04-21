//
//  N1.m
//  LeetCode
//
//  Created by liangweidong on 2020/4/16.
//  Copyright © 2020 liangweidong. All rights reserved.
//

#import "N1.h"

@implementation N1

/**
 两数之和：
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 
 示例
 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
//暴力破解法 n的平方-时间复杂度
+(void)test1{
    NSInteger target = 9;
    NSArray *nums = @[@(2), @(7), @(11), @(15)];
    NSMutableArray *results = [NSMutableArray array];
    for (int i = 0; i < nums.count; i++) {
        for (int j = i+1; j < nums.count; j++) {
            NSNumber *iv = nums[i];
            NSNumber *jv = nums[j];
            if (i != j && iv.intValue + jv.intValue == target) {
                [results addObjectsFromArray:@[@(i), @(j)]];
            }
        }
    }
    NSLog(@"%@", results);
}
//采用hash映射
/**
 这道题本身如果通过暴力遍历的话也是很容易解决的，时间复杂度在 O(n2)
 由于哈希查找的时间复杂度为 O(1)，所以可以利用哈希容器 map 降低时间复杂度
 遍历数组 nums，i 为当前下标，每个值都判断map中是否存在 target-nums[i] 的 key 值
 如果存在则找到了两个值，如果不存在则将当前的 (nums[i],i) 存入 map 中，继续遍历直到找到为止
 如果最终都没有结果则抛出异常
 时间复杂度：O(n)
 */
+(void)test2{
    NSInteger target = 9;
    NSArray *nums = @[@(2), @(7), @(11), @(15)];
    NSMutableArray *results = [NSMutableArray array];
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
//    for (int i = 0; i < nums.count; i++) {
//        [tempDic setValue:@(i) forKey:[NSString stringWithFormat:@"%@", nums[i]]];
//    }
    
    for (int i = 0; i < nums.count; i++) {
        NSInteger temp = [[nums objectAtIndex:i] intValue];
        NSInteger haha = target - temp;
        id res = [tempDic objectForKey:[NSString stringWithFormat:@"%li", (long)haha]];
        if (res) {
            [results addObjectsFromArray:@[@(i), res]];
        }else{
            [tempDic setValue:@(i) forKey:[NSString stringWithFormat:@"%@", nums[i]]];
        }
    }
    NSLog(@"%@", results);
}

@end
