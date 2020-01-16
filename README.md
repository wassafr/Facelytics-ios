# Facelytics

[![Version](https://img.shields.io/cocoapods/v/Facelytics.svg?style=flat)](http://cocoapods.org/pods/Facelytics)
[![License](https://img.shields.io/cocoapods/l/Facelytics.svg?style=flat)](http://cocoapods.org/pods/Facelytics)
[![Platform](https://img.shields.io/cocoapods/p/Facelytics.svg?style=flat)](http://cocoapods.org/pods/Facelytics)

Facelytics is an SDK allowing mobile apps to detect faces and then make gender predictions and age predictions on faces.
For more [information](http://facelytics.io/library/ios) about Facelytics.

## Installation

### Cocoapods

[CocoaPods](http://www.cocoapods.org) is the recommended way to add Facelytics to your project.

1. Add a pod entry for Facelytics to your *Podfile* :

```ruby
pod "Facelytics"
```

2. Install the pod(s) by running `pod install`.

3. Include Facelytics wherever you need it with `#import <Facelytics_SDK/Facelytics_SDK.h>` from Objective-C or `import Facelytics_SDK` from Swift.

### Manual installation

1. Download the [latest code version](https://github.com/wassafr/Facelytics-ios/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Include Facelytics wherever you need it with `#import <Facelytics_SDK/Facelytics_SDK.h>` from Objective-C or `import Facelytics_SDK` from Swift.

## Usage

To run the example project just open it and run. The framework is already included.
Make sure you also see [Facelytics documentation]().
**Attention :** To use the SDK, you need a License Key you can on the [Facelytics website](http://facelytics.io)

The sample code is commented and show usage exemples of the SDK.

###Basics
1. Add the following import to the top of the file or the bringing header for swift:

    ```
    import Facelytics_SDK
    ```
 
 2. Instantiate a Facelytics object

 ```
 facelyticsInstance = Facelytics(licenceKey: "your license key", completion: nil)
 ```
 
 3. Load the prediction models in the Facelytics instance
 ```
 facelyticsInstance?.loadModels(completion: { (error) in
   if let error = error {
     print("❌ Cannot initialize Facelytics \(error.localizedDescription)")
   } else {
     
   }
 })
 ```
 
 4. Make face detections from picture
 ```
 FacelyticsService.shared.facelyticsInstance?.detectFaces(image: sourceGroupImage, completion: { (faces, error) in
   if let faces = faces,
     !faces.isEmpty {
      /// Handle detected faces
   }
 })
 ```
 
 5. You can now use gender or age prediction
 ```
FacelyticsService.shared.facelyticsInstance?.predictAge(faceToPredict: face.image, completion: { (ageResult, error) in

  /// Handle result

})
```
 
## Requirements

- Xcode 11
- iOS 12

## License

Facelytics is available under a commercial license. See the LICENSE file for more info.

## Author

Wassa, contact@wassa.fr
