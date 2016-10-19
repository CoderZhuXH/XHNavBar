Pod::Spec.new do |s|
  s.name         = "XHNavBar"
  s.version      = "1.1"
  s.summary      = "快速创建navigationBar,支持系统navigationBar及自定义navigationBar"
  s.homepage     = "https://github.com/CoderZhuXH/XHNavBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHNavBar.git", :tag => s.version }
  s.source_files = "XHNavBar", "*.{h,m}"
  s.resource_bundles = {"XHNavBarExample" => ["XHNavBar/Resource/*.png"]} 
  s.requires_arc = true
end
