//
//  mdbArticleDetailViewController.m
//  mdb_hd
//
//  Created by wanghaobo on 15/11/24.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "mdbArticleDetailViewController.h"
#import "ArticleManger.h"
@interface mdbArticleDetailViewController ()
@property (nonatomic,strong) UILabel *authorLabel,*publishTime,*titleLabel;
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UITableView *tbView;
@property (nonatomic,strong) ArticleManger *articleManger;
@property (nonatomic,assign) double labelActualSizeHeight;
@end

@implementation mdbArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    self.articleManger = [[ArticleManger alloc]init];
    self.articleManger.delegate = self;
    [self.articleManger getArticleDetail];
    [self.tbView reloadData];

}
//- (void)updateArticleDetail
//{
//    NSDictionary *dic = self.articleManger.artDetailDataSource;
//    
//    NSDictionary *subDic = [dic objectForKey:@"result"];
//    
//    NSString *author = [subDic objectForKey:@"author"];
//    
//    NSString *content = [subDic objectForKey:@"content"];
//    NSString *publishTime = [subDic objectForKey:@"publishTime"];
//    NSString *title = [subDic objectForKey:@"title"];
////    NSLog(@"titile shi %@",title);
//    NSString *shortDesc = [subDic objectForKey:@"shortDesc"];
//    
//    self.authorLabel.text = author;
//    self.titleLabel.text = title;
//    
//    //设置 自适应
//    UIFont *font = [UIFont boldSystemFontOfSize:24];
//    self.titleLabel.font =font;
//    //拆行
//    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    //必须写不然只写一行
//    [self.titleLabel setNumberOfLines:0];
//    //最大尺寸
//    //maxfloat可设置为最大高度
//    CGSize size = CGSizeMake(self.view.frame.size.width, MAXFLOAT);
//    //获取当前那本属性
//    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
//    CGSize actualSize = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil].size;
//    
//    self.labelActualSizeHeight = actualSize.height;
//    self.titleLabel.frame = CGRectMake(10, 40, actualSize.width, actualSize.height);
//    
//    
//    //日期格式化 显示
//    NSDate *date = [NSDate date];
//    [date dateByAddingTimeInterval:[publishTime doubleValue]];
//    NSDateFormatter *format = [[NSDateFormatter alloc]init];
//    format.dateStyle = kCFDateFormatterLongStyle;
//    format.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
//    self.publishTime.text = [format stringFromDate:date];
//    
//    //webView内容显示
//    [self.webView loadHTMLString:content baseURL:nil];
//    
//    
//}

- (void)layoutUI
{
    //zuo zhe
    self.authorLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 60 , 100, 36)];
    self.authorLabel.text = @"bobo";
    self.authorLabel.font = [UIFont fontWithName:@"Arial" size:10];
    [self.view addSubview:self.authorLabel];

    // fa bu shi jian
    self.publishTime = [[UILabel alloc]initWithFrame:CGRectMake(200 ,60, 100,36)];
    self.publishTime.text = @"2015/10/24";
    self.authorLabel.font = [UIFont fontWithName:@"Arial" size:10];
    [self.view addSubview:self.publishTime];
    
    // biao ti
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 300, 36)];
    self.titleLabel.text = @"汪浩波无意间发现地球是圆的";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [self.view addSubview:self.titleLabel];
    
    // nei rong
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, self.view.frame.size.height)];
    [self.view addSubview:self.webView];
    
    // guan zhu
    self.tbView = [[UITableView alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, self.view.frame.size.height-200)];
    
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    
    
    [self.view addSubview:self.tbView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleManger.artDetailDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    //cell.textLabel.text = @"monkeydbobo1";
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
