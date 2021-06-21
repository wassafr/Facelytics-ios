Pod::Spec.new do |spec|
  spec.name             = "Facelytics"
  spec.version          = "2.1.0"
  spec.summary          = "Facelytics is an SDK allowing mobile apps to detect people faces by analyzing the pictures"
  spec.description      = <<-DESC
Facelytics is able to track multiple faces and then detect gender and age for each detected face.
DESC

  spec.homepage         = "https://facelytics.io"
  spec.license          = { :type => 'COMMERCIAL', :file => 'LICENSE.md'}
  
  spec.author           = { "Wassa" => "bertrand.villain@wassa.io" }

  spec.source           = { :http => 'https://github.com/wassafr/Facelytics-ios/raw/master/Facelytics_SDK.zip'}
  #spec.source           = { :http => 'file:' + __dir__ + '/Facelytics_SDK.zip' }

  spec.platform          = :ios, '13.0'
  spec.swift_versions    = '5.4'

  spec.ios.vendored_frameworks = 'Facelytics_SDK.framework'
  spec.frameworks = 'Facelytics_SDK'
  spec.dependency 'ZIPFoundation', '~> 0.9.9'

end
