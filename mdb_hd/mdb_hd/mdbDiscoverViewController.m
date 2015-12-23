//
//  mdbDiscoverViewController.m
//  mdb_hd
//
//  Created by wanghaobo on 15/11/23.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "mdbDiscoverViewController.h"
#import "ArticleCategory.h"

@interface mdbDiscoverViewController ()
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UITableView *tbView;
@property (nonatomic,strong) UIImage *okImage,*cancelImage;
@end

@implementation mdbDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    CGRect frame = CGRectMake(10, 10, self.view.frame.size.width, self.view.frame.size.height);
    self.tbView = [[UITableView alloc]initWithFrame:frame];
    
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    
    [self.view addSubview:self.tbView];
    
    self.dataSource = [NSMutableArray arrayWithCapacity:5];
    
    
    ArticleCategory *ac = [[ArticleCategory  alloc]init];
    ac.cid = 1;
    ac.name = @"monkeydbobo";
    [self.dataSource addObject:ac];
    
    
    ArticleCategory *ac1 = [[ArticleCategory  alloc]init];
    ac1.cid = 1;
    ac1.name = @"monkeydbobo2";
    [self.dataSource addObject:ac1];
    
    self.okImage = [UIImage imageNamed:@"add_favorite"];
    self.cancelImage = [UIImage imageNamed:@"cancel_favorite"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    ArticleCategory *ac = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = ac.name;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:self.okImage forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 66, 27);
    cell.accessoryView = btn;
    [btn addTarget:self action:@selector(follow:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (IBAction)follow:(UIButton *)sender
{
    UIImage *imag = [sender imageForState:UIControlStateNormal];
    if (imag == self.okImage){
        [sender setImage:self.cancelImage forState:UIControlStateNormal];
    }else{
        [sender setImage:self.okImage forState:UIControlStateNormal];
    }
}

@end
