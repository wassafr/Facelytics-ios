//
//  RecognitionDelegate.h
//  FacelyticsSDK
//
//  Created by Peter SCHAEFFER on 05/02/2014.
//  Copyright (c) 2014 Wassa All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "FLYEvent.h"
/**
 *  Enum describing the possibles capture pressets as a quality scale.
 */
typedef NS_ENUM(NSUInteger, CapturePresset){
    /**
     *  Poor quality, suited for old devices
     */
    Low = 0,
    /**
     *  Medium quality, for regular devices
     */
    Medium = 1,
    /**
     *  High quality, for last devics
     */
    High = 2,
    /**
     *  Ultra quality, currently not supported
     */
    Ultra = 3
};
typedef NS_ENUM(NSInteger, DrawingQuality){
    POOR = -1,
    LOW = 0,
    MEDIUM = 10,
    HIGH = 20,
    ULTRA = 30

};
typedef NS_ENUM(NSInteger, DeviceGeneration){
    iphone4OrOlder = 0,
    iphone4s = 1,
    iphone5 = 2,
    iphone5s = 3,
    iphone6OrBetter = 4,
    unknown= -1
};






/**
 *  Crucial protocol to be able to retrieve faces in an event-driven way
 */
@protocol FLYDetectionDelegate <NSObject>

@optional

/**
 *  Return currently detected faces as an array of Face objects
 *
 *  @param faces the current faces, nil if no face is present
 */
- (void)didReturnFacesAsEvent:(FLYEvent*)event;
/**
 * [Deprecated] Returns a faces descriptions as a json (easier to use didReturnFacesAsObjects:)
 *
 *  @param dictionary contains complete information about the current faces as a dictionary
 */
- (void)didReturnFacesAsJsonString:(NSString*)jsonString __attribute__((deprecated));
;
/**
 *  Called when the detection stops after licence time is passed. Usefull if you want to dismiss the camera view / end the FLY framework funtionality
 *
 */
- (void)detectionDidStopAfterLicenceElapsedTime;


@end
