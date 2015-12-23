//
//  mdbTableViewCell.h
//  mdb_hd
//
//  Created by wanghaobo on 15/11/23.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mdbTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *authorLabel;
@property (nonatomic,strong) UILabel *publishTimeLabel;
@property (nonatomic,strong) UILabel *shortDesLabel;

@end
