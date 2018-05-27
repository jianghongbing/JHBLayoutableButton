Pod::Spec.new do |s|
  s.name         = "JHBLayoutableButton"
  s.version      = "0.0.1"
  s.summary      = "a lightweight and easy extension for layout UIButton image and title"
  s.homepage     = "https://github.com/jianghongbing/JHBLayoutableButton"
  s.license      = "MIT"
  s.author       = "jianghongbing"
  s.platform     = :ios, "8.0"
  s.source       = {:git => "https://github.com/jianghongbing/JHBLayoutableButton.git", :tag => "#{s.version}" }
  s.source_files = "Classes/**/*.{h,m}"
  s.framework    = "UIKit"
  s.requires_arc = true
end
