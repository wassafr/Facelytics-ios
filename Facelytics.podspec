
Pod::Spec.new do |spec|
  spec.name             = "Facelytics"
  spec.version          = "2.0.1"
  spec.summary          = "Facelytics is an SDK allowing mobile apps to detect people faces by analyzing the pictures"
  spec.description      = <<-DESC
Facelytics is able to track multiple faces and then detect gender and age for each detected face.
DESC

  spec.homepage         = "https://facelytics.io"
  spec.license          = { :type => 'COMMERCIAL', :file => 'Facelytics_SDK.framework/LICENSE.md'}
  
  spec.author           = { "Wassa" => "bertrand.villain@wassa.io" }

  spec.source           = { :http => 'https://github.com/wassafr/Facelytics-ios/raw/master/Facelytics_SDK.zip'}
  #spec.source           = { :http => 'file:' + __dir__ + '/Facelytics_SDK.zip' }

  spec.platform          = :ios, '12.0'
  spec.swift_versions    = '5.1.2'

  spec.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }

  spec.ios.vendored_frameworks = 'Facelytics_SDK.framework'
  spec.frameworks = 'Facelytics_SDK'
  spec.dependency 'ZIPFoundation', '~> 0.9.9'

end
