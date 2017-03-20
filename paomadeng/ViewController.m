//
//  ViewController.m
//  paomadeng
//
//  Created by djzx on 2017/3/17.
//  Copyright © 2017年 kangyuejie. All rights reserved.
//

#import "ViewController.h"
#import "detatilViewController.h"
#import "WQLPaoMaView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    WQLPaoMaView *paoma;
}

@property (nonatomic,strong) NSTimer *timer ;
@property (nonatomic,assign)CGFloat hightcell;
@property(nonatomic,strong)NSArray * arraytext;



@property (nonatomic,strong)UILabel * AD;
@end

static CGFloat cellhight = 40.0;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableviewpm = [[UITableView alloc]init];
    self.tableviewpm.frame = CGRectMake(40, 100, 300, 40);
    self.tableviewpm.delegate = self;
    self.tableviewpm.dataSource =self;
    [self.view addSubview:self.tableviewpm];
    
    self.arraytext = [[NSArray alloc]init];
    self.arraytext = @[@"时尚1",@"时得到的2",@"时尚空间3",@"时尚空间4",@"时尚空间5",@"时尚空间6",@"时尚空间7",@"时尚空间8",@"时尚空间9",@"时尚空间10"];
    self.hightcell = cellhight;
    self.tableviewpm.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self startTimer];
    
    paoma = [[WQLPaoMaView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50) withTitle:@"全场卖两块，买啥都两块，两块钱，你买不了吃亏，两块钱，你买不了上当，真正的物有所值。拿啥啥便宜 买啥啥不贵，都两块，买啥都两块，全场卖两块，随便挑，随便选，都两块～～ "];
    [self.view addSubview:paoma];
    [paoma start];
    
    
}

/**
 *  开始定时器
 */
-(void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    //通知主线程
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/**
 *  下一页
 */
-(void)nextPage
{
    if (self.hightcell >= cellhight*self.arraytext.count) {
        [self.tableviewpm setContentOffset:CGPointMake(0,0 ) animated:NO];
        self.hightcell = cellhight;
    } else {
        
        [self.tableviewpm setContentOffset:CGPointMake(0,self.hightcell ) animated:YES];
        
        self.hightcell = self.hightcell + cellhight;
    }
    
    
    NSLog(@"nextPage");
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arraytext.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellhight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor colorWithRed:0.61 green:0.60 blue:0.61 alpha:1.00];
    cell.textLabel.text = self.arraytext[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击==%ld",(long)indexPath.row);
    
    detatilViewController * detatile = [[detatilViewController alloc]init];
    
    [self presentViewController:detatile animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
