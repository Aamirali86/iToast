Pod::Spec.new do |s|
  s.name             = 'SmartToast'
  s.version          = '0.1.4'
  s.summary          = 'Android-like toast with very simple interface.'

  s.description      = 'iToast is a Swift libaray that adds toast notifications to the UIView object class. It is intended to be simple, lightweight, and easy to use. Most toast notifications can be triggered with a single line of code.'

  s.homepage         = 'https://github.com/Aamirali86/iToast.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muhammad Aamir Ali' => 'aamir-muhammad@hotmail.com' }
  s.source           = { :git => 'https://github.com/Aamirali86/iToast.git', :tag => s.version.to_s }
  s.social_media_url = 'http://linkedin.com/in/muhammadaamirali/'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.1'
  s.source_files = 'SmartToast/Classes/**/*'
  
  #  s.resource_bundles = {
  #    'SmartToast' => ['SmartToast/Assets/*.png']
  #  }

end
