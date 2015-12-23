//
//  mdbHomeViewController.m
//  mdb_hd
//
//  Created by wanghaobo on 15/11/23.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "mdbHomeViewController.h"
#import "mdbTableViewCell.h"
#import "ArticleManger.h"
#import "Article.h"
#import "mdbArticleDetailViewController.h"

@interface mdbHomeViewController ()
@property (nonatomic,strong)UITableView *tbView;

@property (nonatomic,strong)ArticleManger *artManger;
@end

@implementation mdbHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"首页";
    self.artManger = [[ArticleManger alloc]init];
    [self.artManger getArticleList];
    self.artManger.delegate = self;
    
    
    CGRect frame = CGRectMake(10, 10, self.view.frame.size.width-20, self.view.frame.size.height-20);
    self.tbView = [[UITableView alloc]initWithFrame:frame];
    self.tbView.dataSource = self;
    self.tbView.delegate = self;
    [self.view addSubview:self.tbView];
    
    
  
}
- (void)updateArticleList{
    
    NSLog(@"收到通知了,更新表单");
    [self.tbView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artManger.artListDataSource.count;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cid = @"cid";
    mdbTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[mdbTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
  
    Article *a = [self.artManger.artListDataSource objectAtIndex:indexPath.row];
    cell.titleLabel.text = a.title;
    cell.authorLabel.text = a.author;
    
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[a.publishTime doubleValue]];
    [date dateByAddingTimeInterval:[a.publishTime doubleValue]];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateStyle = kCFDateFormatterLongStyle;
    format.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    
    cell.publishTimeLabel.text = [format stringFromDate:date];
    cell.shortDesLabel.text = a.shortDec;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    mdbArticleDetailViewController *ac = [self.storyboard instantiateViewControllerWithIdentifier:@"article_detail_sid"];
    
    [self.navigationController pushViewController:ac animated:YES];
}
@end
