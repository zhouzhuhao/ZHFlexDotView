# ZHFlexDotView

[![CI Status](https://img.shields.io/travis/zhouzhuhao/ZHFlexDotView.svg?style=flat)](https://travis-ci.org/zhouzhuhao/ZHFlexDotView)
[![Version](https://img.shields.io/cocoapods/v/ZHFlexDotView.svg?style=flat)](https://cocoapods.org/pods/ZHFlexDotView)
[![License](https://img.shields.io/cocoapods/l/ZHFlexDotView.svg?style=flat)](https://cocoapods.org/pods/ZHFlexDotView)
[![Platform](https://img.shields.io/cocoapods/p/ZHFlexDotView.svg?style=flat)](https://cocoapods.org/pods/ZHFlexDotView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ZHFlexDotView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZHFlexDotView'
```

## Usage
```Objective-C
#pragma mark -DEBUG模式下才显示Flex,如果需要打包后的ipa也出现Flex,就需要在scheme中配置Archive时为debug
#if DEBUG
	NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
	for (UIWindow *win in frontToBackWindows) {
		if (win.windowLevel == UIWindowLevelNormal) {
			self.zhView = [[ZHFlexDotView alloc] initWithFrame:CGRectMake(0, 200, 60, 60)];
			[win addSubview:self.zhView];
			break;
		}
	}
#endif
```
Release模式下，去除Flex代码
![image](https://github.com/zhouzhuhao/ZHFlexDotView/blob/master/images/WeChat8b62ad6f28a90d4fba0f23ea455f566e.png)


## Author

johnzhuhaochow@gmail.com

## License

ZHFlexDotView is available under the MIT license. See the LICENSE file for more info.
