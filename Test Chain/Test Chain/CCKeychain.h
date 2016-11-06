//
//  CCKeychain.h
//  测试 Boundle
//
//  Created by CC on 2016/11/5.
//  Copyright © 2016年 CC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface CCKeychain : NSObject

//查询钥匙串
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;

//保存或修改
+ (void)save:(NSString *)service data:(id)data;

//加载（读取）
+ (id)load:(NSString *)service;

//删除
+ (void)delete:(NSString *)service;

@end
