//
//  YJKeychain.h
//  YJSurce
//
//  Created by Macintosh HD on 2017/3/6.
//  Copyright © 2017年 Macintosh HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface YJKeychain : NSObject
/**
 *  储存字符串到🔑钥匙串
 *
 *  @param sValue 对应的Value
 *  @param sKey   对应的Key
 */
+ (void)saveKeychainValue:(NSString *)sValue key:(NSString *)sKey;


/**
 *  从🔑钥匙串获取字符串
 *
 *  @param sKey 对应的Key
 *
 *  @return 返回储存的Value
 */
+ (NSString *)readKeychainValue:(NSString *)sKey;


/**
 *  从🔑钥匙串删除字符串
 *
 *  @param sKey 对应的Key
 */
+ (void)deleteKeychainValue:(NSString *)sKey;
@end
