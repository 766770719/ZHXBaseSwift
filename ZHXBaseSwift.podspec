Pod::Spec.new do |s|
  s.name         = "ZHXBaseSwift"
  s.version      = "1.0.3"
  s.summary      = "Swift Base Project."
  s.homepage     = "https://github.com/766770719/ZHXBaseSwift"
  s.license      = "MIT"
  s.author       = { "zhx" => "766770719@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/766770719/ZHXBaseSwift.git", :tag => "#{s.version}" }
  s.source_files  = "ZHXBaseSwift", "ZHXBaseSwift/**/*.{h,m,swift}"
  s.framework  = "UIKit"
  s.swift_version = "4.0.0"

  s.dependency 'SnapKit', '~> 4.0.0'
  s.dependency 'DynamicColor', '~> 4.0.2'
end
