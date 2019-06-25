//
//  ZHViewController.m
//  ZHFlexDotView
//
//  Created by zhouzhuhao on 06/25/2019.
//  Copyright (c) 2019 zhouzhuhao. All rights reserved.
//

#import "ZHViewController.h"

#import <ZHFlexDotView/ZHFlexDotView-umbrella.h>

#import <FLEX/FLEX.h>


@interface ZHViewController ()
@property (nonatomic,strong) ZHFlexDotView *dotView;
@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	self.dotView = [[ZHFlexDotView alloc] initWithFrame:CGRectMake(0, 60, 80, 80)];

	
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	// 确保window加载了
	[[UIApplication	 sharedApplication].keyWindow addSubview:self.dotView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
