Pod::Spec.new do |s|
  s.name         = "YYPopView"
  s.version      = "0.0.2"
  s.summary      = "A Sample PopView on iOS."
  s.homepage     = "https://github.com/Heisenbean/PopView"
  s.license      = "MIT"

  s.author             = { "Heisenbean" => "heisenbean.me@gmail.com" }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/Heisenbean/PopView.git", :tag => s.version }
  s.source_files = 'PopView/Resource/*.swift'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.requires_arc = true
end
