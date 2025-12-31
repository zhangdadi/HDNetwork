Pod::Spec.new do |s|
  s.name             = 'HDNetwork'
  s.version          = '1.0.0'
  s.summary          = 'HDNetwork'
  s.description      = <<-DESC
                       A longer description of YourPodName.
                       DESC
  s.homepage         = 'https://github.com/zhangdadi/HDNetwork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangdadi' => 'z_dadi@163.com' }
  s.source           = { :git => 'https://github.com/yourusername/YourPodName.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'HDNetwork/**/*'
  s.dependency 'YYModel', '~> 1.0.4'
  s.dependency 'AFNetworking', '~> 4.0.1'
end