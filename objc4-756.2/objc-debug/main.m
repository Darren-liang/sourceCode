//
//  main.m
//  objc-debug
//
//  Created by Cooci on 2019/10/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "runtime.h"

extern size_t malloc_size(const void *ptr);
int main(int argc, const char * argv[]) {
    
    
    
    
    Person *pp = [[Person alloc] init];
//    pp->_a = 1;
//    pp->_c = 'c';
//    pp->_d = 'd';
        
//    NSLog(@"objc对象实际需要的内存大小: %zd", class_getInstanceSize([Person class]));
//    NSLog(@"objc对象实际分配的内存大小: %zd", malloc_size((__bridge const void *)(pp)));
    NSLog(@"%@", @(sizeof(id)));
    

    return 0;
}



