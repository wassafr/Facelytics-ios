//
//  FLYCamera.h
//  FacelyticsSDK
//
//  Created by Peter SCHAEFFER on 03/02/2014.
//  Copyright (c) 2014 Wassa All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

/**
 *  A class representing a camera input device built arround AVCaptureDevice. You can modify this object to easily modify camera settings. You can also acces and modify the underlaying AVCAptureDeviceInstance throught the device getter
 */
@interface FLYCamera : NSObject

/**
 *  Camera representing the front camera of the device.
 *
 *  @return a FLYCamera representing the device front camera. nil if no front camera is present
 */
+ (instancetype)frontCamera;
/**
 *  Camera representing the back camera of the device.
 *
 *  @return FLYCamera representing the device back camera. nil if no front camera is present
 */
+ (instancetype)backCamera;
/**
 *  Camera representing AVCaptureDevicePosition specified as argument
 *
 *  @param position the position of the device
 *
 *  @return FLYCamera representing the device at the specified location. nil if no camera is present at this location
 */
+ (instancetype)cameraWithPosition:(AVCaptureDevicePosition)position;
/**
 *  Safely update the flash mode
 *
 *  @param Mode The required mode, can be auto, on or off
 *
 *  @return YES if the flash mode was successfully set
 */
- (BOOL)setFlashMode:(AVCaptureFlashMode)Mode;
/**
 *  Safely update the torch mode
 *
 *  @param Mode  The required mode, can be auto, on or off
 *
 *  @return YES if the torch mode was successfully set
 */
- (BOOL)setTorchMode:(AVCaptureTorchMode)Mode;
/**
 *  Safely update the torch mode
 *
 *  @param Mode  The required mode, can be auto, on or off
 *  @param level The torch power between 0 and 1
 *
 *  @return YES if the torch mode and level was successfully set
 */
- (BOOL)setTorchMode:(AVCaptureTorchMode)Mode Level:(float)level;
/**
 *  Safely update the White Balance mode of the camera
 *
 *  @param Mode The required mode, can be lock, auto or continuous
 *
 *  @return YES The White balance mode and level was successfully set
 */
- (BOOL)setWBMode:(AVCaptureWhiteBalanceMode)Mode;
/**
 *  Compare 2 camera positions
 *
 *  @param other Other camera
 *
 *  @return YES if the 2 cameras has the same postions
 */
- (BOOL)isEqual:(FLYCamera*)other;
/**
 *  Returns if the camera is the front camera
 *
 *  @return YES if the camera is the front camera
 */
- (BOOL)isFrontCamera;
/**
 *  Returns if the camera is the back camera
 *
 *  @return YES if the camera is the back camera
 */
- (BOOL)isBackCamera;

/**
 *  Request access to the camera asyncronisly, required for ios8 and more
 *
 *  @param completion asyncronous reponse, true if the camera access is granted
 */
+ (void)requestCameraAccessPermission:(void(^)(BOOL authorized))completion;
/**
 *  Access to the underlaying AVCaptureDevice, allows updating all CaptureDeviceSettings
 *
 *  @return the underlaying avCatptureDevice
 */
- (AVCaptureDevice*)device;

@end
