//
//  ArticleManger.h
//  mdb_hd
//
//  Created by wanghaobo on 15/11/24.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArticleMangerDelegate <NSObject>

@optional
- (void)updateArticleList;
- (void)updateArticleDetail;

@end

@interface ArticleManger : NSObject
- (void)getArticleList;
- (void)getArticleDetail;
@property (nonatomic,strong) id<ArticleMangerDelegate> delegate;

@property (nonatomic,strong) NSMutableArray *artListDataSource;
@property (nonatomic,strong) NSDictionary *artDetailDataSource;

@end
