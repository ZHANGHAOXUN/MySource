//
//  NSVideoParser.m
//  xmlDemo
//
//  Created by Apple on 16/11/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "NSVideoParser.h"

@interface NSVideoParser()<NSXMLParserDelegate>

@property(nonatomic,strong) NSMutableArray * videoModelList;

//字符串拼接
@property(nonatomic,strong) NSMutableString *mString;

//当前的model
@property(nonatomic,strong) HMVideoModel *currentModel;

@end

@implementation NSVideoParser

-(void)parserWithDataAsync:(NSData *)data complete:(void (^)(NSArray<HMVideoModel *> *))completeBlock{

    //开启线程
    [[NSOperationQueue new] addOperationWithBlock:^{
        
        //子线程
       NSArray *marray=  [self parserWithData:data];
        if(completeBlock){
            completeBlock(marray.copy);
        }
        
    }];
}

-(NSArray<HMVideoModel *> *)parserWithData:(NSData *)data{
    //SAX方式解析
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    //设置代理
    parser.delegate = self;
    //手动开启解析
    [parser parse];
    
    //返回
    return self.videoModelList;
}


#pragma mark xml
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    //开始解析文档
    
    //初始化
    self.videoModelList = [NSMutableArray array];
    self.mString = [NSMutableString string];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    //解析到开始标签
    
    if([elementName isEqualToString:@"video"]){
        HMVideoModel *model = [[HMVideoModel alloc] init];
        self.currentModel = model;
        [self.videoModelList addObject:model];
        //从属性中获取videoId
        model.videoId = @(attributeDict[@"videoId"].intValue);
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //解析到标签中的文字,会调用多次,要字符串拼接
    [self.mString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    //解析到结束标签
    
    
    [self.currentModel setValue:self.mString forKey:elementName];
    
    self.mString.string = @"";
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    //文档解析结束
//    NSLog(@"%@",self.videoModelList);
}
@end
