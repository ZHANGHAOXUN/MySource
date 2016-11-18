//
//  HMVideoModel.h
//  xmlDemo
//
//  Created by Apple on 16/11/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
网络模型中
 1.不要使用基本数据类型
 KVC null
 2.Copy 防止KVC直接地址的传递->内部引用外部的地址,外部变量一改变,属性跟着一起改
 */
@interface HMVideoModel : NSObject

@property(nonatomic,copy) NSNumber *videoId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSNumber *length;
@property(nonatomic,copy) NSString *videoURL;
@property(nonatomic,copy) NSString *imageURL;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *teacher;

@end
