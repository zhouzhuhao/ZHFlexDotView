//
//  ZHFlexDotView.m
//  Pods
//
//  Created by John on 2019/6/25.
//

#import "ZHFlexDotView.h"

#import <FLEX/FLEX.h>

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define animateDuration 0.3       //位置改变动画时间
#define showDuration 0.1          //展开动画时间
#define statusChangeDuration  3.0    //状态改变时间
#define normalAlpha  0.8           //正常状态时背景alpha值
#define sleepAlpha  0.3           //隐藏到边缘时的背景alpha值
#define myBorderWidth 1.0         //外框宽度
#define marginWith  5             //间隔


@interface ZHFlexDotView ()

@property (nonatomic,strong) UIPanGestureRecognizer *pan;


@end


@implementation ZHFlexDotView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initViews];
	}
	return self;
}

 - (void)initViews{
	
	 CGFloat red = (arc4random() % 255 ) / 255.0 + 0.5;
	 CGFloat green = (arc4random() % 255 ) / 255.0 + 0.5;
	 CGFloat blue = (arc4random() % 255 ) / 255.0 + 0.5;
	 
	 UIColor *bgColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
	 self.backgroundColor = bgColor;
	 
	 self.layer.cornerRadius = self.frame.size.width / 2.0;

	 self.userInteractionEnabled = YES;
	 
	 self.cBtn = [[UIButton alloc] init];
	 
	 self.cBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	 [self addSubview:self.cBtn];
	 

	 [self.cBtn addTarget:self action:@selector(cBtnClicked) forControlEvents:UIControlEventTouchUpInside];
	 
	 _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
	 _pan.delaysTouchesBegan = NO;
	 [self addGestureRecognizer:self.pan];
	 
	 [self performSelector:@selector(changeStatus) withObject:nil afterDelay:statusChangeDuration];
	
}

- (void)cBtnClicked{
	
//	if (self.FlexBtnClickedBlock) {
//		self.FlexBtnClickedBlock();
//	}
	
	NSLog(@"tap tap tap");
	self.alpha = normalAlpha;
	[[FLEXManager sharedManager] showExplorer];
		//拉出悬浮窗
	if (self.center.x == 0) {
		self.center = CGPointMake(WIDTH/2, self.center.y);
	}else if (self.center.x == kScreenWidth) {
		self.center = CGPointMake(kScreenWidth - WIDTH/2, self.center.y);
	}else if (self.center.y == 0) {
		self.center = CGPointMake(self.center.x, HEIGHT/2);
	}else if (self.center.y == kScreenHeight) {
		self.center = CGPointMake(self.center.x, kScreenHeight - HEIGHT/2);
	}
	
	[self performSelector:@selector(changeStatus) withObject:nil afterDelay:statusChangeDuration];
	
}

- (void)locationChange:(UIPanGestureRecognizer*)p
{
	
	
	if (p != self.pan) {
		return;
	}
	
	CGPoint panPoint = [p locationInView:[[UIApplication sharedApplication] keyWindow]];
	if(p.state == UIGestureRecognizerStateBegan)
		{
		[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeStatus) object:nil];
		self.alpha = normalAlpha;
		}
	if(p.state == UIGestureRecognizerStateChanged)
		{
		self.center = CGPointMake(panPoint.x, panPoint.y);
		}
	else if(p.state == UIGestureRecognizerStateEnded)
		{
//		[self stopAnimation];
		[self performSelector:@selector(changeStatus) withObject:nil afterDelay:statusChangeDuration];
		
		if(panPoint.x <= kScreenWidth/2)
			{
			if(panPoint.y <= 40+HEIGHT/2 && panPoint.x >= 20+WIDTH/2)
				{
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(panPoint.x, HEIGHT/2);
				}];
				}
			else if(panPoint.y >= kScreenHeight-HEIGHT/2-40 && panPoint.x >= 20+WIDTH/2)
				{
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(panPoint.x, kScreenHeight-HEIGHT/2);
				}];
				}
			else if (panPoint.x < WIDTH/2+20 && panPoint.y > kScreenHeight-HEIGHT/2)
				{
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(WIDTH/2, kScreenHeight-HEIGHT/2);
				}];
				}
			else
				{
				CGFloat pointy = panPoint.y < HEIGHT/2 ? HEIGHT/2 :panPoint.y;
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(WIDTH/2, pointy);
				}];
				}
			}
		else if(panPoint.x > kScreenWidth/2)
			{
			if(panPoint.y <= 40+HEIGHT/2 && panPoint.x < kScreenWidth-WIDTH/2-20 )
				{
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(panPoint.x, HEIGHT/2);
				}];
				}
			else if(panPoint.y >= kScreenHeight-40-HEIGHT/2 && panPoint.x < kScreenWidth-WIDTH/2-20)
				{
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(panPoint.x, kScreenHeight-HEIGHT/2);
				}];
				}
			else if (panPoint.x > kScreenWidth-WIDTH/2-20 && panPoint.y < HEIGHT/2)
				{
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(kScreenWidth-WIDTH/2, HEIGHT/2);
				}];
				}
			else
				{
				CGFloat pointy = panPoint.y > kScreenHeight-HEIGHT/2 ? kScreenHeight-HEIGHT/2 :panPoint.y;
				[UIView animateWithDuration:animateDuration animations:^{
					self.center = CGPointMake(kScreenWidth-WIDTH/2, pointy);
				}];
				}
			}
		}
}



- (void)changeStatus
{
	[UIView animateWithDuration:1.0 animations:^{
		self.alpha = sleepAlpha;
	}];
	[UIView animateWithDuration:0.5 animations:^{
		CGFloat x = self.center.x < 20+WIDTH/2 ? 0 :  self.center.x > kScreenWidth - 20 -WIDTH/2 ? kScreenWidth : self.center.x;
		CGFloat y = self.center.y < 40 + HEIGHT/2 ? 0 : self.center.y > kScreenHeight - 40 - HEIGHT/2 ? kScreenHeight : self.center.y;
			//禁止停留在4个角
		if((x == 0 && y ==0) || (x == kScreenWidth && y == 0) || (x == 0 && y == kScreenHeight) || (x == kScreenWidth && y == kScreenHeight)){
			y = self.center.y;
		}
		self.center = CGPointMake(x, y);
	}];
}

@end
