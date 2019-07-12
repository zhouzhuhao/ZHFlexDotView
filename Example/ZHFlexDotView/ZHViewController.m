//
//  ZHViewController.m
//  ZHFlexDotView
//
//  Created by zhouzhuhao on 06/25/2019.
//  Copyright (c) 2019 zhouzhuhao. All rights reserved.
//

#import "ZHViewController.h"
#import <ZHFlexDotView/ZHFlexDotView-umbrella.h>

@interface ZHViewController ()
@property (nonatomic,strong) ZHFlexDotView *dotView;
@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
#pragma mark -DEBUG模式下才显示Flex,如果需要打包后的ipa也出现Flex,就需要在scheme中配置Archive时为debug ,需要window出现才能添加
#if DEBUG
	NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
	for (UIWindow *win in frontToBackWindows) {
		if (win.windowLevel == UIWindowLevelNormal) {
			self.dotView = [[ZHFlexDotView alloc] initWithFrame:CGRectMake(0, 60, 80, 80)];
			[win addSubview:self.dotView];
			break;
		}
	}
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
