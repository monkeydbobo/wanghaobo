//
//  Article.h
//  mdb_hd
//
//  Created by wanghaobo on 15/11/23.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic,assign) int aid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *shortDec;

@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *publishTime;

@end
