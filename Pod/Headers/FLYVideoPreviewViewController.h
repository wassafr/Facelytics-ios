//
//  VideoPreviewViewController.h
//  FLY
//
//  Created by Peter SCHAEFFER on 17/04/13.
//
//

#import <AVFoundation/AVFoundation.h>
#import "FLYObjcProtocols.h"
#import "FLYCaptureManager.h"

/**
 *  ViewController responsible for displaying a FLYCaptureManagerPreview
 */
@interface FLYVideoPreviewViewController : UIViewController <FLYDetectionDelegate>

/**
 *  A reference to the capture manager, allows you to bypass the sharedInstance and use a different captureManager per preview
 */
@property (strong) FLYCaptureManager *captureManager;

/**
 *  retruns the currently used captureManager, can be the local capture manager instance or the shared instance if the localvariable is nil
 *
 *  @return the currently used capture manager
 */
- (FLYCaptureManager*)currentCaptureManager;


/**
 *  Returns the drawnFrame (frame with faces and informations burned in it depending on the configuration file)
 *
 *  @param drawnFrame a UIImage representing the current camera view + various drawings
 */
- (void)didReturnDrawnFrame:(UIImage*)drawnFrame;

@end

