
Pod::Spec.new do |s|
  
  # 1 - Info
  s.name             = 'RCSceneCall'
  s.version          = '0.0.2'
  s.summary          = 'Scene Call'
  s.description      = "Scene Call module"
  s.homepage         = 'https://github.com/rongcloud'
  s.license      = { :type => "Copyright", :text => "Copyright 2022 RongCloud" }
  s.author           = { 'shaoshuai' => 'shaoshuai@rongcloud.cn' }
  s.source           = { :git => 'https://github.com/rongcloud-community/rongcloud-scene-call-ios.git', :tag => s.version.to_s }
  
  # 2 - Version
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  
  # 3 - config
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'VALID_ARCHS' => 'arm64 x86_64',
  }
  
  # 4 - source
  s.source_files = 'RCSceneCall/Classes/**/*'
  
  # 5 - dependency
  s.dependency 'ReactorKit'
  s.dependency 'RxDataSources'
  
  s.dependency 'RCSceneRoom', '>= 0.0.2.3'
  s.dependency 'RCSceneCallKit'
  
end
