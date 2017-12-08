//
//  ViewController.m
//  xinDemo
//
//  Created by hao on 2017/12/6.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

    //AFHTTP3.0
-(void)requestNetwork{
    
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];

    manger.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manger GET:@"http://m.baidu.com" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
    }];

}
-(void)requestAFHTTPTextHtml{
    
     AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
     manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     [manger GET:@"http://apiinfoios.ydbimg.com/Default.aspx?type=app&id=13421" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
     NSLog(@"%@",responseObject);
     
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     NSLog(@"%@",error);
     }];
    
}
//AFHTTP2.*
-(void)request{
    AFHTTPRequestOperationManager * manger = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    manger.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manger.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript" ,@"text/plain" , nil];
     manger.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manger GET:@"http://m.baidu.com" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


@end
