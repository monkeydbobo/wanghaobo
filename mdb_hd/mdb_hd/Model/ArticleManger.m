//
//  ArticleManger.m
//  mdb_hd
//
//  Created by wanghaobo on 15/11/24.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "ArticleManger.h"
#import "AFNetworking.h"
#import "Article.h"
#import "mdbArticleDetailViewController.h"

@implementation ArticleManger
- (instancetype)init{
    
    if (self == [super init]) {
        self.artListDataSource = [NSMutableArray arrayWithCapacity:5];
        self.artDetailDataSource = [[NSDictionary alloc]init];
        return self;
    }
    return nil;
}

- (void)getArticleList{
    NSString *url = @"http://huiduservice.lanxijun.com/articleList.json?appId=cuunyVcB1QBTmNUN&pageNum=1&pageSize=10&sign=OI3Bp%2Bl7o6OykbBTjxJVM50JpIBpRZKvNFWTUEfxAfY%3D&timestamp=1448863200";
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //异步
        NSLog(@"JSON: %@", responseObject);
        
        NSDictionary *dic = responseObject;
        NSArray *array = [dic objectForKey:@"result"];
        
        for (NSDictionary *d in array) {
            NSString *aid = [d objectForKey:@"id"];
            NSString *author = [d objectForKey:@"author"];
            NSString *publishTime = [d objectForKey: @"publishTime"];
            NSString *shortDesc = [d objectForKey:@"shortDesc"];
            NSString *title = [d objectForKey:@"title"];
            NSString *content = [d objectForKey:@"content"];
            NSString *url = [d objectForKey:@"url"];
            
            Article *article = [[Article alloc]init];
            article.aid = [aid intValue];
            article.author = author;
            article.publishTime = publishTime;
            article.shortDec = shortDesc;
            article.title = title;
            article.content = content;
            article.url = url;
            
            [self.artListDataSource addObject:article];
            
        }
        
        [self.delegate updateArticleList];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}
- (void)getArticleDetail
{
    NSString *url = @"http://article.lanxijun.com/articleDetail.json?appId=hQCxinnGahes5iXQ&id=35336&sign=8TOxDWrrSFhJdRC2v%2Frtogi0qjk88pohyUvwoVHINyg%3D&signType=1";
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //异步
        NSLog(@"JSON: %@", responseObject);
        self.artDetailDataSource = responseObject;
        [self.delegate updateArticleDetail];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

@end
