//
//  ViewController.m
//  AFNetWorkingCode
//
//  Created by liangweidong on 2020/4/11.
//  Copyright © 2020 liangweidong. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *pp = [Person new];
    pp.str = @"l1d";
    NSLog(@"%@", pp.str);
//    pp->_a = 1;
//    pp->_b = 2.2;
//    pp->_c = 'c';
//    pp->_d = 'd';
    
    NSLog(@"objc对象实际需要的内存大小: %zd", class_getInstanceSize([Person class]));
//    NSLog(@"objc对象实际分配的内存大小: %zd", malloc_size((__bridge const void *)(pp)));
   NSLog(@"%@", @(sizeof(id)));
    
    
    BOOL isSuccess = class_addIvar([Person class], "sex", sizeof(BOOL), 0, "B");
    isSuccess ? NSLog(@"成功") : NSLog(@"失败");//失败
    NSLog(@"objc对象实际需要的内存大小: %zd", class_getInstanceSize([Person class]));
    
    
    [self get_ivars:[Person class]];
    [self get_propertys:[Person class]];
    [self dynamicCreateClass];
    
}
-(void)get_ivars:(Class)clss{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(clss, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        NSLog(@"====%@", key);
    }
}

-(void)get_propertys:(Class)clss{
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList(clss, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        NSLog(@"1111111==%@", key);
    }
}

#pragma mark 动态创建类
-(void)dynamicCreateClass{
    Class Dog = objc_allocateClassPair([NSObject class], "Dog", 0);
    NSLog(@"objc对象实际需要的内存大小: %zd", class_getInstanceSize(Dog));
    //增加实例变量
    /**
        参数一、类名
        参数二、属性名称
        参数三、开辟字节长度
        参数四、对其方式
        参数五、参数类型 “@” 官方解释 An object (whether statically typed or typed id) （对象 静态类型或者id类型） 具体类型可参照官方文档
     */
    BOOL isSuccess = class_addIvar(Dog, "sex", sizeof(BOOL), 0, "B");
    isSuccess ? NSLog(@"成功") : NSLog(@"失败");
    BOOL isSuccess2 = class_addIvar(Dog, "sex2", 0, 0, "B");
    NSLog(@"objc对象实际需要的内存大小: %zd", class_getInstanceSize(Dog));
    
    //增加属性
    /**
     * 参数一、 cls 修改的类
     * 参数二、 name 属性名字
     * 参数三、 attributes 属性数组
     * 参数四、 attributeCount 属性数组数量
     */
    objc_property_attribute_t type = {"T", "@\"NSString\""};//类型
    objc_property_attribute_t ownership = {"C", ""};//C:copy
    objc_property_attribute_t nonatomic = {"N", ""};//N:nonatomic
    objc_property_attribute_t nameIvar = {"V", "_name1"};//V:实例变量
    objc_property_attribute_t attributs[] = { type, ownership, nonatomic, nameIvar };
    BOOL suc = class_addProperty(Dog, "name1", attributs, 4);
    NSLog(@"objc对象实际需要的内存大小: %zd", class_getInstanceSize(Dog));
    [self get_ivars:Dog];
    [self get_propertys:Dog];
    
    
    //动态创建方法
    BOOL haha = class_addMethod(Dog, @selector(setName1:), (IMP)setName1, "V@:");
    setName1(self, _cmd, @"lwd");
}

static void setName1(id self, SEL _cmd, NSString *name1){
    Ivar ivar = class_getInstanceVariable([self class], "sex");
    object_setIvar(self, ivar, name1);
    id obj = object_getIvar(self, ivar);
    NSLog(@"");
}

@end
