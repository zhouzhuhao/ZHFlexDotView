# ZHFlexDotView


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
			ZHFlexDotView *dotView = [[ZHFlexDotView alloc] initWithFrame:CGRectMake(0, 200, 60, 60)];
			[win addSubview:dotView];
			break;
		}
	}
#endif
```
Release模式下，去除Flex代码
![image](https://github.com/zhouzhuhao/ZHFlexDotView/blob/master/images/WeChat8b62ad6f28a90d4fba0f23ea455f566e.png)

基于FLex可以快速查看UI布局以及应用内的网络请求
![511623841999_ pic_hd](https://user-images.githubusercontent.com/11433842/122209444-1b862a00-ced7-11eb-980d-778dd9084de2.jpg)



## Author

johnzhuhaochow@gmail.com

## License

ZHFlexDotView is available under the MIT license. See the LICENSE file for more info.
