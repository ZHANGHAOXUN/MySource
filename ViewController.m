//
//  ViewController.m
//  xmlDemo
//
//  Created by Apple on 16/11/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "HMVideoModel.h"
#import "NSVideoParser.h"

@interface ViewController ()<NSXMLParserDelegate>

//@property(nonatomic,strong) NSMutableArray * videoModelList;
//
////字符串拼接
//@property(nonatomic,strong) NSMutableString *mString;
//
////当前的model
//@property(nonatomic,strong) HMVideoModel *currentModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getXML];
}


- (void)getXML {
    //获取xml数据
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    
    [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //同步
        NSVideoParser *parser = [NSVideoParser new];
//        NSArray *array =  [parser parserWithData:data];
//        NSLog(@"%@",array);
        
        //异步
        [parser parserWithDataAsync:data complete:^(NSArray<HMVideoModel *> *array) {
            NSLog(@"%@",array);
        }];
        
    }];
}
@end
