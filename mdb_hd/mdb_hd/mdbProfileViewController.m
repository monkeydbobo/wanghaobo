//
//  mdbProfileViewController.m
//  mdb_hd
//
//  Created by wanghaobo on 15/11/23.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "mdbProfileViewController.h"

@interface mdbProfileViewController ()
@property (nonatomic,strong) UITableView *tbView;
@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation mdbProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人";
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height - 10);
    self.tbView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    //Group分区
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    
    [self.view addSubview: self.tbView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    //表格里面分区的数量;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0){
        return 2;
    }else if (section == 1){
        return 1;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"我的关注";
        }if (indexPath.row == 1) {
            cell.textLabel.text = @"我的收藏";
        }
        
    }if (indexPath.section == 1) {
        cell.textLabel.text = @"设置";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
