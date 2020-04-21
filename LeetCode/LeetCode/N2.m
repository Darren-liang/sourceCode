//
//  N2.m
//  LeetCode
//
//  Created by liangweidong on 2020/4/16.
//  Copyright © 2020 liangweidong. All rights reserved.
//

#import "N2.h"
#import "ListElemt.h"


struct LinkCode{
    int value;
    struct LinkCode *next;
};
typedef struct LinkCode LinkCode;

static inline LinkCode LinkCodeMake(int value, LinkCode *code){
    LinkCode link;
    link.value = value;
    link.next = code;
    return link;
};


@implementation N2
/**
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */
+(ListElemt *)test1{
    ListElemt *f4 = ListElemtMake(1, nil);
    ListElemt *f3 = ListElemtMake(3, f4);
    ListElemt *f2 = ListElemtMake(4, f3);
    ListElemt *f1 = ListElemtMake(2, f2);
    

    
    ListElemt *s3 = ListElemtMake(4, nil);
    ListElemt *s2 = ListElemtMake(6, s3);
    ListElemt *s1 = ListElemtMake(5, s2);
    
    ListElemt *code = f1;
    ListElemt *sssCode = s1;
    
    ListElemt *current = nil;
    ListElemt *head = nil;
    int yushu = 0;
    while (code && sssCode) {
        int v = (code->value+sssCode->value)%10;
        ListElemt *temp = ListElemtMake(v+yushu, nil);
        if (!current) {
            current = temp;
            head = temp;
        }else{
            current->next = temp;
            current = temp;
        }
        
        yushu = (code->value+sssCode->value)/10;
        

        code = code->next;
        sssCode = sssCode->next;
    }
    
    if (code != nil && sssCode) {
        while (sssCode) {
            ListElemt *temp = ListElemtMake(yushu+sssCode->value, nil);
            current->next = temp;
            current = temp;
            sssCode = sssCode->next;
        }
    }else if (code && !sssCode){
        while (code) {
            ListElemt *temp = ListElemtMake(yushu+code->value, nil);
            current->next = temp;
            current = temp;
            code = code->next;
        }
    }
    NSInteger hh = 1;
    NSInteger sum = 0;
    while (head) {
        NSLog(@"%i", head->value);
        sum = sum+ hh*(head->value);
        head = head->next;
        hh = hh*10;
    }
    return head;
    
}

ListElemt* ListElemtMake(int value ,ListElemt *next){
    ListElemt *elemt = [ListElemt new];
    elemt->value = value;
    elemt->next = next;
    return elemt;
}

@end



