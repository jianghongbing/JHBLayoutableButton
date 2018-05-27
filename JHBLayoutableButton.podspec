Pod::Spec.new do |s|
  s.name         = "JHBLayoutableButton"
  s.version      = "0.0.1"
  s.summary      = "an extension of UIButton, lightweight and easy"
  s.homepage     = "https://github.com/jianghongbing/JHBLayoutableButton"
  s.license      = "MIT"
  s.author       = "jianghongbing"
  s.platform     = :ios, "8.0"
  s.source       = https://github.com/jianghongbing/JHBLayoutableButton.git
  s.source_files = "JHBLayoutableButton/Classes/*.{h,m}"
  s.framework    = "UIKit"
  s.requires_arc = true
end
