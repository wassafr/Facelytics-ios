# Facelytics

[![Version](https://img.shields.io/cocoapods/v/Facelytics.svg?style=flat)](http://cocoapods.org/pods/Facelytics)
[![License](https://img.shields.io/cocoapods/l/Facelytics.svg?style=flat)](http://cocoapods.org/pods/Facelytics)
[![Platform](https://img.shields.io/cocoapods/p/Facelytics.svg?style=flat)](http://cocoapods.org/pods/Facelytics)

Facelytics is an SDK allowing mobile apps to detect face criterias of people by analyzing the front video feed in realtime. Facelytics is able to track multiple faces and then detect gender, some emotions, age range and accessories, for each detected face. For more [informations](http://face-lytics.com). You can download a sample application on the [appstore](https://itunes.apple.com/ai/app/facelytics/id997764123) to see usage exemples for the sdk

## Installation

### Cocoapods

[CocoaPods](http://www.cocoapods.org) is the recommended way to add CaptchaFace to your project.

1. Add a pod entry for Facelytics to your *Podfile* :

```ruby
pod "Facelytics"
```

2. Install the pod(s) by running `pod install`.
3. Include Facelytics wherever you need it with `#import <Facelytics/Facelytics.h>` from Objective-C or `import Facelytics` from Swift.
4. The library embeded in the cocoapods is compiled in debug mode to allow you to attach the debugger while developement. A release version of the library is available in the **Pod/lib** directory of the [following archive](https://github.com/wassafr/Facelytics-ios/archive/master.zip) if you want better performances in your release build 

### Manual installation

1. Download the [latest code version](https://github.com/wassafr/Facelytics-ios/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Drag and drop the **Pod** directory from the archive in your project navigator. Make sure to select *Copy items* when asked if you extracted the code archive outside of your project.
3. Under `Pod/lib` there is 2 versions of the library, you need to add to your target only the one you need (wether you ar debugging or making a release)
4. Download the [opencv library](http://sourceforge.net/projects/opencvlibrary/files/opencv-ios/2.4.9/opencv2.framework.zip/download) and drag and drop the opencv2.framework in your project navigator.
5. Add the opencv dependancies in your project properties in *Build Phases* > *Link with libraries* :
    * libstdc++
    * Accelerate
    * AssetsLibrary
    * AVFoundation
    * CoreGraphics
    * CoreImage
    * CoreMedia
    * CoreVideo
    * Foundation
    * QuartzCore
    * ImageIO
    * MobileCoreServices
    * UIKit
6. Include Facelytics wherever you need it with `#import "Facelytics.h"` from Objective-C or `import Facelytics` from Swift.




## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first. With [CocoaPods](http://www.cocoapods.org) , you can run `pod try Facelytics`
from the command line.

Make sure you also see [Facelytics documentation on Cocoadocs](http://cocoadocs.org/docsets/Facelytics).

**Attention :** To use the SDK, you need a API key that you can get for free on the [Facelytics website](http://face-lytics.com)

The sample code is commented and show usage exemples of the SDK.

###Basics
1. Add the following import to the top of the file or the bringing header for swift:

    ```
    #import <Facelytics/Facelytics.h>
    ```
The main sdk entry point is the FLYCaptureManager object.You have to keep a strong reference on the object while the session is running. You will need a new license request at each FLYCaptureManager creation. It's recomanded to create a new FLYCaptureManager for each session.

2. Optional : If the entire interface is based on Facelytics, you can check if the device can run Facelytics prior to show any Facelytics related UI :

  ```objc
    if([FLYCaptureManager deviceSupportsFacelytics])
    {
        //goto step 3-4
    }
    else
    {
        //fallback if the device can't use facelytics
    }
  ```
3. Optional : If the entire interface is based on Facelytics, you can check if you are authorised to launch Facelytics prior to show any Facelytics related UI. You need an apikey to lauch the sdk. You can visite  [Facelytics website](http://face-lytics.com) to get a free demo key :

    ```objc
    
    self.currentManager = [FLYCaptureManager alloc] init]
    [self.currentManager requestLicenceAuthorisation:@"<your_key>" completion:^(NSError *error) {
        if(!error)
        {
            //show the facelytics related ui
        }
        else
        {
            //handle the error ( can be no camera, camera access not granted, device not powerfull enough or provided licence invalid
        }
    }];
    ```

4. Optional, you can show a Facelytics related UI (ie. a view with the live video feed and an appropriate drawing). I you want to show a fullscreen preview, simply show a UIViewController which inherits from `FLYVideoPreviewViewController`. I you want to show a non fullScreen preview, you can attach an instance of `FLYVideoPreviewViewController`to the capture manager by using the function '- (NSError*)attachPreview:(FLYVideoPreviewViewController*)preview' (see the sample code for different exemples)
      
5. You have to start the sdk to begin analyzing faces. You can do it in the 'viewDidAppear' of the related ViewController for exemple
If you didn't perform step 3 :
   
   ```objc
   [self.currentManager startCapturewithDefaultCameraAndLicenceKey:@"kuc" completion:^(NSError *error) {
   if(error)
   {
    //handle the error ( can be no camera, camera access not granted, device not powerfull enough or provided licence invalid

   }
   else
   {
       //start the face detection. By default only the camera feed is started
       [self.currentManager startFaceRecognition];
       
       //step 6
   }
       }];
    ```
   
   If you already performed step 3 :
   
   ```objc
   [self.currentManager startCapturewithDefaultCameraCompletion:^(NSError *error) {
   if(error)
   {
    //handle the error ( can be no camera, camera access not granted, device not powerfull enough or provided licence invalid
   
   }
   else
   {
       //start the face detection. By default only the camera feed is started
       [self.currentManager startFaceRecognition];
       
       //step 6
   }
     
    }];
   ```
   Look at the documentation of 'FLYCamera' to allow you to customize camera settings
6. Optional : You can assign a `FLYDetectionDelegate` to the capture manager to receive face related event and to know when the session is over to hide the related ui :

    ```objc
    [self.currentManager setDetectionDelegate:id<FLYDetectionDelegate>];
    ```
You should implement the method `- (void)detectionDidStopAfterLicenceElapsedTime` to know when the session is over and do the appropriate ui staff.

7. When you're done, stop the session by calling the `[self.currentManager stopFaceRecognition]` method
`
 
## Requirements

* Xcode 5
* iOS 7
* ARC
* Devices responding to `[FLYCaptureManager deviceSupportsFacelytics]`, typically iPhones from iphone 4s and iPads from the iPad3

## License

Facelytics is available under a commercial license. See the LICENSE file for more info.

## Author

Wassa, contact@wassa.fr

