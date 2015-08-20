//
//  FacelyticsDemoViewController.h
//  Facelytics
//
//  Created by Peter Schaeffer on 20/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Facelytics/Facelytics.h>
@interface FacelyticsDemoViewController : UIViewController <FLYDetectionDelegate>


@property (nonatomic,strong) NSString *currentGender;
@property (nonatomic,strong) NSString *currentAge;
@property (nonatomic,strong) NSString *currentEmotion;
@property (nonatomic,assign) NSInteger maxUsers;

@property (strong) FLYCaptureManager *captureManager;

@end
