//
//  ViewController.m
//  paomadeng
//
//  Created by djzx on 2017/3/17.
//  Copyright © 2017年 kangyuejie. All rights reserved.
//

#import "ViewController.h"
#import "detatilViewController.h"
#import "KYJPaoMaDengView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    KYJPaoMaDengView *paoma;
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
    
    UILabel * maengban = [[UILabel alloc]initWithFrame:CGRectMake(40, 100, 300, 40)];
    maengban.backgroundColor =[UIColor clearColor];
    maengban.userInteractionEnabled = YES;
    [self.view addSubview: maengban];
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [maengban addGestureRecognizer:tap];
    
    self.arraytext = [[NSArray alloc]init];
    self.arraytext = @[@"因为我刚好遇见你",@"留下足迹才美丽",@"风吹花落泪如雨",@"因为不想分离",@"因为刚好遇见你",@"留下十年的期许",@"我想我会再记起你",@"我们哭了",@"我们笑着",@"我们抬起头望天空"];
    self.hightcell = cellhight;
    self.tableviewpm.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self startTimer];
    
    paoma = [[KYJPaoMaDengView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50) withTitle:@"因为我刚好遇见你，留下足迹才美丽，风吹花落泪如雨，因为不想分离，因为刚好遇见你，留下十年的期许，如果再相遇，我想我会再记起你，我们哭了，我们笑着，我们抬起头望天空，星星还有几颗，我们唱着时间的歌，才懂得相互拥抱 "];
    [self.view addSubview:paoma];
    [paoma start];
    
    
}

-(void)tapAction{
    
    NSLog(@"点击");
    
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
//    NSLog(@"当前%f",self.hightcell/cellhight);
    
    if (self.hightcell >= cellhight*self.arraytext.count) {
        [self.tableviewpm setContentOffset:CGPointMake(0,0 ) animated:NO];
        self.hightcell = cellhight;
    } else {
        

        [self.tableviewpm setContentOffset:CGPointMake(0,self.hightcell ) animated:YES];
        
        self.hightcell = self.hightcell + cellhight;
    }
    
    
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
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
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
