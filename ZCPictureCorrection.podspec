Pod::Spec.new do |spec|
  spec.name         = "ZCPictureCorrection"
  spec.version      = "1.0.0"
  spec.summary      = "ZCPictureCorrection Kit"
  spec.description  = "ZCPictureCorrection 图片矫正"
  spec.platform     = :ios, '8.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/ZCPictureCorrection'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/ZCPictureCorrection.git', :tag => spec.version.to_s }
  spec.vendored_frameworks = 'ZCPictureCorrection.framework'
  spec.resources   = "ZCPictureCorrectionPng.bundle"
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'

end
