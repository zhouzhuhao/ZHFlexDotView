#
# Be sure to run `pod lib lint ZHFlexDotView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHFlexDotView'
  s.version          = '1.0.2'
  s.summary          = 'Quick show flex tool'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zhouzhuhao/ZHFlexDotView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhouzhuhao' => 'johnzhuhaochow@gmail.com' }
  s.source           = { :git => 'https://github.com/zhouzhuhao/ZHFlexDotView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ZHFlexDotView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZHFlexDotView' => ['ZHFlexDotView/Assets/*.png']
  # }

# s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

  s.dependency 'FLEX', '~> 2.4.0'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  # release模式下，不包编译Flex文件设置
  #In Xcode, navigate to the "Build Settings" tab of your project. Click the plus and select Add User-Defined Setting.
  #Name the setting EXCLUDED_SOURCE_FILE_NAMES. For your Release configuration, set the value to FLEX*. This will exclude all files with the prefix FLEX from compilation. Leave the value blank for your Debug configuration.

end
