//
//  AppDelegate.h
//  AFNetWorkingCode
//
//  Created by liangweidong on 2020/4/11.
//  Copyright © 2020 liangweidong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

