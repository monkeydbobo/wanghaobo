//
//  mdbTableViewCell.m
//  mdb_hd
//
//  Created by wanghaobo on 15/11/23.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "mdbTableViewCell.h"

@implementation mdbTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self UILayout];
        return self;
    }
    return nil;
}
- (void)UILayout{
    
    CGRect frame = CGRectMake(10, 10, 300, 36);
    self.titleLabel = [[UILabel alloc]initWithFrame:frame];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
   
    frame = CGRectMake(10, 45, 100, 36);
    self.authorLabel = [[UILabel alloc]initWithFrame:frame];
    self.authorLabel.font = [UIFont systemFontOfSize:12];
    
    frame = CGRectMake(100, 45, 100, 36);
    self.publishTimeLabel = [[UILabel alloc]initWithFrame:frame];
    self.publishTimeLabel.font = [UIFont systemFontOfSize:12];

    frame = CGRectMake(10, 70, 300, 36);
    self.shortDesLabel = [[UILabel alloc]initWithFrame:frame];
    self.shortDesLabel.font = [UIFont systemFontOfSize:14];

    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.publishTimeLabel];
    [self.contentView addSubview:self.shortDesLabel];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
