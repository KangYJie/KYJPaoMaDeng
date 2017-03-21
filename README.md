    ##类似京东快报
    self.arraytext = [[NSArray alloc]init];
    self.arraytext = @[@"因为我刚好遇见你",@"留下足迹才美丽",@"风吹花落泪如雨",@"因为不想分离",@"因为刚好遇见你",@"留下十年的期许",@"我想我会再记起你",@"我们哭了",@"我们笑着",@"我们抬起头望天空"];
    self.hightcell = cellhight;

    //开始动画	
    [self startTimer];

    paoma = [[KYJPaoMaDengView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50) withTitle:@"因为我刚好遇见你，留下足迹才美丽，风吹花落泪如雨，因为不想分离，因为刚好遇见你，留下十年的期许，如果再相遇，我想我会再记起你，我们哭了，我们笑着，我们抬起头望天空，星星还有几颗，我们唱着时间的歌，才懂得相互拥抱 "];
    [self.view addSubview:paoma];
    [paoma start];
