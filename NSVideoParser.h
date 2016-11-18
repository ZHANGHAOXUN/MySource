//
//  NSVideoParser.h
//  xmlDemo
//
//  Created by Apple on 16/11/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMVideoModel.h"

@interface NSVideoParser : NSObject

//提供xml的SAX的同步解析->模型数组
-(NSArray<HMVideoModel *> *)parserWithData:(NSData *)data;

//如果xml比较大,那么解析可能成为一个耗时任务,异步
-(void)parserWithDataAsync:(NSData *)data complete:(void(^)(NSArray<HMVideoModel *> *array))completeBlock;

@end
