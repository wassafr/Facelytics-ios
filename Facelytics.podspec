
Pod::Spec.new do |s|
  s.name             = "Facelytics"
  s.version          = "2.0.0"
  s.summary          = "Facelytics is an SDK allowing mobile apps to detect people faces by analyzing the pictures"
  s.description      = <<-DESC
Facelytics is able to track multiple faces and then detect gender and age for each detected face.
DESC

  s.homepage         = "https://facelytics.io"
  s.license          = { :type => 'COMMERCIAL' }
  
  s.author           = { "Wassa" => "bertrand.villain@wassa.io" }

  s.source           = { :git => "https://github.com/wassafr/Facelytics-ios.git", :tag => s.version.to_s }
  #s.source            = { :http => 'file:' + __dir__ + '/Facelytics_SDK.zip' }

  s.platform          = :ios, '12.0'
  s.swift_versions    = '5.1.2'

  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }

  s.ios.vendored_frameworks = 'Facelytics_SDK.framework'
  s.frameworks = 'Facelytics_SDK'
  s.dependency 'ZIPFoundation', '~> 0.9.9'

end
