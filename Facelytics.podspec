#
# Be sure to run `pod lib lint Facelytics.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Facelytics"
  s.version          = "1.0.0"
s.summary          = "Facelytics is an SDK allowing mobile apps to detect face criterias of people by analyzing the front video feed in realtime."
  s.description      = <<-DESC
Facelytics is able to track multiple faces and then detect gender, some emotions, age range and accessories, for each detected face.
DESC

s.homepage         = "http://face-lytics.com"
   s.screenshots     = "http://a1.mzstatic.com/us/r30/Purple1/v4/f0/91/7b/f0917be0-b832-78a3-e2c3-91e5aa2af982/screen322x572.jpeg", "http://a3.mzstatic.com/us/r30/Purple7/v4/c4/5b/bb/c45bbbc4-efca-de49-033d-c29bd574027d/screen322x572.jpeg"
  s.license          = 'COMMERCIAL'
  s.author           = { "Wassa" => "contact@wassa.fr" }
  s.source           = { :git => "https://github.com/<wassafr/Facelytics-ios.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.resources = ['Pod/Assets/*']

  s.source_files = 'Pod/Headers/*.h'
  s.public_header_files = 'Pod/Headers/*.h'
  s.vendored_libraries= 'Pod/lib/libFacelyticsSDK_debug.a'
  s.dependency 'OpenCV', '~> 2.4.9.1'
end
