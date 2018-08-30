#
# Be sure to run `pod lib lint SmartToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SmartToast'
  s.version          = '0.1.2'
  s.summary          = 'Android-like toast with very simple interface.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'iToast is a Swift libaray that adds toast notifications to the UIView object class. It is intended to be simple, lightweight, and easy to use. Most toast notifications can be triggered with a single line of code.'

  s.homepage         = 'https://github.com/Aamirali86/iToast.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aamir' => 'muhammad.aamir@venturedive.com' }
  s.source           = { :git => 'https://github.com/Aamirali86/iToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'SmartToast/Classes/**/*'
  
  #  s.resource_bundles = {
  #    'SmartToast' => ['SmartToast/Assets/*.png']
  #  }

end
