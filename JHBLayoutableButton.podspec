Pod::Spec.new do |s|
  s.name         = "JHBLayoutableButton"
  s.version      = "0.0.2"
  s.summary      = "a subclass of UIButton, which support custom layout button's image view and title label"
  s.homepage     = "https://github.com/jianghongbing/JHBLayoutableButton"
  s.license      = "MIT"
  s.author       = "jianghongbing"
  s.platform     = :ios, "7.0"
  s.source       = {:git => "https://github.com/jianghongbing/JHBLayoutableButton.git", :tag => "#{s.version}" }
  s.source_files = "Classes/**/*.{h,m}"
  s.framework    = "UIKit"
  s.requires_arc = true
end
