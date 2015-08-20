//
//  CaptureManager.h
//  FacelyticsSDK
//
//  Created by Peter SCHAEFFER on 31/01/2014.
//  Copyright (c) 2014 Wassa All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "FLYCamera.h"
#import "FLYObjcProtocols.h"
@class FLYVideoPreviewViewController;
@class FLYData;

/**
 *  The main object of the sdk, reponsible for the capture and forwarding frames to the FLYdetectionManager and results to a WDetectionDelegate and / or a preview
 */
@interface FLYCaptureManager : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate,AVCaptureFileOutputRecordingDelegate>

#pragma mark class methods

/**
 *  Methods that determine whether the device can execute the sdk smoothly. should be called before capture is started.
 *
 *  @return YES if the device can run Facelytics
 */
+ (bool)deviceSupportsFacelytics;

/**
 *  Get the facelytics version as a string
 *
 *  @return a version string representation
 */
+ (NSString*)getSDKVersionString;

#pragma mark instance methods
/**
 *  Request asyncronous authorisation to launch the sdk, error is nil in case of success. Usefull to check for licence before showing the camera screen / Framework funcionality. Once successfully check, no more check is needed to relaunch the sdk
 *
 *  @param licenceKey the key to be checked (must be not nil)
 *  @param completion returns an error in case of failure
 */
- (void)requestLicenceAuthorisation:(NSString*)licenceKey completion:(void(^)(NSError *error))completion;

/**
 *  Call the startCapturewithCamera:(FLYCamera*)camera completion:(void(^)(NSError *error))completion method with licence check
 *
 *  @param camera     FLYCamera instance
 *  @param licenceKey the key to be checked (must be not nil)
 *  @param completion returns an error in case of failure, can be a camera error or a licence error
 */
- (void)startCapturewithCamera:(FLYCamera*)camera licenceKey:(NSString*)licenceKey completion:(void(^)(NSError *error))completion;

/**
 *  Call the startCapturewithDefaultCameraCompletion:(void(^)(NSError *error))completion
 *
 *  @param licenceKey he key to be checked (must be not nil)
 *  @param completion returns an error in case of failure, can be a camera error or a licence error
 */
- (void)startCapturewithDefaultCameraAndLicenceKey:(NSString*)licenceKey completion:(void(^)(NSError *error))completion;


/**
 *  Start video capture, the frame flow is initiated. on ios8 and more, authorisation is asked to access the camera.
 *
 *  @param camera   FLYCamera instance
 *  @param completion the completion block, the error is not nil if the captured doesn't started. Can be because of permission not granted or if the required camera is not accesible
 */
- (void)startCapturewithCamera:(FLYCamera*)camera completion:(void(^)(NSError *error))completion;
/**
 *  Start video capture withe the default camera (strored in the FLYData object, front by default), the frame flow is initiated. on ios8 and more, authorisation is asked to access the camera.
 *
 *  @param completion the completion block, the error is not nil if the captured doesn't started. Can be because of permission not granted or if the required camera is not accesible
 */
- (void)startCapturewithDefaultCameraCompletion:(void(^)(NSError *error))completion;
/**
 *  Stop the video capture.
 */
- (void)stopCapture;
/**
 *  Put capture in pause, the drawing is still runing, the same frame is repetively sent to the processing
 */
- (void)pauseCapture;
/**
 *  Resume a paused capture. do nothing if the capture was not paused
 */
- (void)resumeCapture;
/**
 *  Toggle between paused and started state
 */
- (void)togglePauseState;
/**
 *  Attach a preview to the capture manager. The FLYVideoPreviewViewController is responsable for displaying tha capture and the results of the processings. detach the previous preview if it was present.
 *
 *  @param preview a FLYVideoPreviewViewController instance or subclass
 *
 *  @return an error if the attachement failed, nil if it worked
 */
- (NSError*)attachPreview:(FLYVideoPreviewViewController*)preview;
/**
 *  Update the current capture orientation depending of the current device orientation.
 *
 *  @return an error if the orientation cannot be set
 */
- (NSError*)setVideoOrientation;
/**
 *  Stop Forwarding frames to the attached preview if it was attached.
 */
- (void)detachPreview;
/**
 *  Check if a preview is attached to the capture manager.
 *
 *  @return YES if a preview is attached
 */
- (BOOL)previewIsAttached;
/**
 *  Safely change the camera of the captureManager even if started. detach the previous binded camera if present.
 *
 *  @param camera to be binded. if nil, the current camera is binded
 *
 *  @return an error if the cameara binding failed
 */
- (NSError*)bindCamera:(FLYCamera*)camera;
/**
 *  Toggle the current camera between front and back.
 *
 *  @return an error if the camera toggle failed
 */
- (NSError*)toggleCamera;
/**
 *  Returns the size of the image captured by the camera depending on capture settings.
 *
 *  @return the size of the capture , {0,0} if the capture wasn't started
 */
- (CGSize)getCaptureSize;
/**
 *  Start the processing of the frames, by default, loading the default configuration file ( config ).
 */
- (void)startFaceRecognition;

/**
 *  Stops the face recognition the capture and detach the preview. Must imperatively be called to clear the FLYCaptureManager objects.
 */
- (void)stopFaceRecognition;

#pragma mark properties

/**
 *  If you want that the capture stay in an orientation wether the orientation of the device (usefull when rotation is locked in the application).
 */
@property (nonatomic,assign) UIDeviceOrientation forcedOrientation;
/**
 *  The underlaying AVCaptureSession. Usefull to test the capture is actually running and the applied parameters.
 */
@property (nonatomic,strong,readonly) AVCaptureSession *session;
/**
 *  The current bindedCamera. You must call the bind camera to change the current camera.
 */
@property (nonatomic,strong,readonly) FLYCamera *currentCamera;
/**
 *  The curent loaded pressets. Save the new pressets and call reloadSettings to update loaded settings
 */
@property (nonatomic,strong,readonly) FLYData *pressets;

/**
 *  Allows to retrieve detected faces as they are detected
 */
@property (nonatomic,weak) NSObject <FLYDetectionDelegate>* detectionDelegate;





@end
